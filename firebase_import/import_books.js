const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore, FieldValue } = require("firebase-admin/firestore");
const fs = require("fs");

const serviceAccount = require("./serviceAccountKey.json");

initializeApp({
  credential: cert(serviceAccount),
});

const db = getFirestore();

const booksFile = "../assets/mock/books_data.json";

const data = JSON.parse(
  fs.readFileSync(booksFile, "utf8")
);

const books = data.items || [];
console.log("Number of books:", books.length);
console.log("First book:", books[0]);

const DEFAULT_VENDOR_ID = "bazar_default";

async function getOrCreateAuthor(authorName, batch) {
  const name = authorName.trim();

  if (!name) {
    return null;
  }

  const snapshot = await db
      .collection("authors")
      .where("name", "==", name)
      .limit(1)
      .get();

  if (!snapshot.empty) {
    return snapshot.docs[0].id;
  }

  const authorRef = db.collection("authors").doc();

  batch.set(authorRef, {
    name: name,
    imageUrl: "",
    biography: "",
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  });

  return authorRef.id;
}

async function getOrCreateCategory(categoryName, batch) {
  const name = categoryName.trim();

  if (!name) {
    return null;
  }

  const snapshot = await db
      .collection("categories")
      .where("nameEn", "==", name)
      .limit(1)
      .get();

  if (!snapshot.empty) {
    return snapshot.docs[0].id;
  }

  const categoryRef = db.collection("categories").doc();

  batch.set(categoryRef, {
    nameEn: name,
    nameAr: "",
    createdAt: FieldValue.serverTimestamp(),
    updatedAt: FieldValue.serverTimestamp(),
  });

  return categoryRef.id;
}

async function createDefaultVendor() {
  const vendorRef = db
      .collection("vendors")
      .doc(DEFAULT_VENDOR_ID);

  const existing = await vendorRef.get();

  if (!existing.exists) {
    await vendorRef.set({
      name: "Bazar",
      logoUrl: "",
      rating: 0.0,
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    });

    console.log("Created default vendor.");
  } else {
    console.log("Default vendor already exists.");
  }
}

async function importBooks() {
  console.log(`Found ${books.length} books.`);

  await createDefaultVendor();

  let imported = 0;
  let skipped = 0;

  for (const book of books) {
    const bookId = book.id;

    if (!bookId) {
      console.log("Skipping book without ID.");
      skipped++;
      continue;
    }

    const volumeInfo = book.volumeInfo || {};
    const saleInfo = book.saleInfo || {};

    const title = volumeInfo.title || "";
    const description = volumeInfo.description || "";

    const authors = volumeInfo.authors || [];
    const categories = volumeInfo.categories || [];

    const imageUrl =
        volumeInfo.imageLinks?.thumbnail || "";

    const price =
        saleInfo.retailPrice?.amount ?? 0;

    const batch = db.batch();

    const authorIds = [];

    for (const author of authors) {
      const authorId =
          await getOrCreateAuthor(author, batch);

      if (authorId) {
        authorIds.push(authorId);
      }
    }

    const categoryIds = [];

    for (const category of categories) {
      const categoryId =
          await getOrCreateCategory(category, batch);

      if (categoryId) {
        categoryIds.push(categoryId);
      }
    }

    const bookRef = db
        .collection("books")
        .doc(bookId);

    batch.set(bookRef, {
      title: title,
      description: description,
      imageUrl: imageUrl,

      authorIds: authorIds,
      categoryIds: categoryIds,

      vendorId: DEFAULT_VENDOR_ID,

      price: Math.round(price),
      discountPrice: null,

      averageRating: 0.0,

      createdAt:
          FieldValue.serverTimestamp(),

      updatedAt:
          FieldValue.serverTimestamp(),
    });

    await batch.commit();

    imported++;

    console.log(
        `[${imported}/${books.length}] Imported: ${title}`
    );
  }

  console.log("");
  console.log("================================");
  console.log("IMPORT FINISHED");
  console.log("Imported:", imported);
  console.log("Skipped:", skipped);
  console.log("================================");
}

importBooks().catch((error) => {
  console.error("IMPORT FAILED:");
  console.error(error);
});