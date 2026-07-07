import 'package:flutter/material.dart';

class OnboardingThree extends StatefulWidget {
  const OnboardingThree({super.key});

  @override
  State<OnboardingThree> createState() => _OnboardingThreeState();
}

class _OnboardingThreeState extends State<OnboardingThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
              padding: const EdgeInsets.only(left: 24,top: 16),
              child:Align(
                alignment: Alignment.topLeft,
              
              child: Container(
                
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
                padding: EdgeInsets.symmetric(horizontal:16,vertical: 8),
                child: Text("Skip",style:TextStyle(color: Color(0xff54408C),fontSize: 14,fontWeight: FontWeight.w500,),)
                ),),
            ),
            Image.asset("assets/onboarding3.png",width: 320,height: 320,fit: BoxFit.contain,),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 14,left: 39,right: 38),
                child: SizedBox(
                  width: 243,
                  height: 32,
                  child: Text("Start Your Adventure",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xff121212)),textAlign: TextAlign.center,)),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 12,right: 42,left: 41),
                child: SizedBox(
                  width: 243,
                  height: 72,
                  child: Text(" Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffA6A6A6)),textAlign: TextAlign.center,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28,right: 133,left: 135),
                child: Row(
                  spacing:2 ,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xffE8E8E8),
                      shape: BoxShape.circle,
                              )),
                  
                    
                    Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xffE8E8E8),
                      shape: BoxShape.circle,
                              )), 
                      Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xff54408C),
                      shape: BoxShape.circle,
                              )),                    
                  
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32,right: 24,left: 24),
                child: Column(
                  spacing: 8,
                  children: [
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        width: 327,
                        height: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff54408C),
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                        child: Text("Get Started",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 16),textAlign: TextAlign.center,),
                                      
                      ),
                    ),
                    Container(
                      width: 327,
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffFAF9FD),
                        borderRadius: BorderRadius.circular(12),
                        
                      ),
                      child: Text("Sign in",style: TextStyle(color: Color(0xff54408C),fontWeight: FontWeight.w700,fontSize: 16),textAlign: TextAlign.center,),
                
                    ),
                  ],
                ),
              ),
          ],
        ),
      )),
    );
  }
}