const { initializeApp, cert } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");

const serviceAccount = require("./serviceAccountKey.json");

initializeApp({
  credential: cert(serviceAccount),
});

const db = getFirestore();

async function test() {
  console.log("Connecting to Firebase...");

  const snapshot = await db.collection("books").limit(1).get();

  console.log("Firebase connection successful.");
  console.log("Existing books:", snapshot.size);
}

test().catch((error) => {
  console.error("Firebase connection failed:");
  console.error(error);
});