import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:roofa/const/picker.dart';
import '../../../Firebase/firebase.dart';
import '../../../Firebase/reports.dart';
import '../../../const/text_app.dart';

import '../../../const/const_color.dart';

class AddChangesTReport extends StatelessWidget {
  final controller = Get.put(AddChangesController());
  var deviceName = TextEditingController();
  var deviceType = TextEditingController();
  var deviceSerialNumber = TextEditingController();
  var report = TextEditingController();

  Future<void> sendAssignment() async {
    await controller.sendAssignment();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'إضافة تركيبات وتبديلات'
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.r,
                        right: 12.r,
                        top: 12.r,
                        bottom: 5.r
                    ),
                    child: Row(
                      children: [
                        Text('رقم التذكرة',style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                              color: colorShadowSearch.withOpacity(.26),
                              offset: Offset(0,4),
                              blurRadius: 10.0
                          )
                        ]
                    ),
                    child: TextFormField(
                      readOnly: true,
                      autofocus: true,
                      // controller: ticketNum,
                      decoration: InputDecoration(
                          fillColor: Color(0xffF3F3F3),
                          filled: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: Report.reportNumber,//'[7AEE00CVF]'
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.r,
                        right: 12.r,

                        bottom: 5.r
                    ),
                    child: Row(
                      children: [
                        Text('نوع الإضافة',style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.all(5.r),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          width: 235.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                    color: colorShadowSearch.withOpacity(.23),
                                    blurRadius: 10,
                                    offset: Offset(0, 4))
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.onClickButton2(0);
                                      controller.typeAdd.value = 'تركيبات';
                                      print(controller.typeAdd.value);
                                    },
                                    child: AnimatedContainer(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: controller.index2.value == 0
                                              ? mainColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(50.r)),
                                      child: Text(
                                        'تركيبات',
                                        style: TextStyle(
                                          color: controller.index2.value == 0
                                              ? controller.textButtonActive2
                                              : mainColor,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 800),
                                    ),
                                  )),
                              Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.onClickButton2(1);
                                      controller.typeAdd.value = 'تبديلات';
                                      print(controller.typeAdd.value);
                                    },
                                    child: AnimatedContainer(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: controller.index2.value == 1
                                              ? mainColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(50.r)),
                                      child: Text(
                                        'تبديلات',
                                        style: TextStyle(
                                          color: controller.index2.value == 1
                                              ? controller.textButtonActive2
                                              : mainColor,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 800),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.r,
                        right: 12.r,
                        top: 12.r,
                        bottom: 5.r
                    ),
                    child: Row(
                      children: [
                        Text('نوع الجهاز',style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                              color: colorShadowSearch.withOpacity(.26),
                              offset: Offset(0,4),
                              blurRadius: 10.0
                          )
                        ]
                    ),
                    child: TextFormField(
                      autofocus: true,
                      controller: deviceType,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.r,
                        right: 12.r,

                        bottom: 5.r
                    ),
                    child: Row(
                      children: [
                        Text('اسم الجهاز',style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                              color: colorShadowSearch.withOpacity(.26),
                              offset: Offset(0,4),
                              blurRadius: 10.0
                          )
                        ]
                    ),
                    child: TextFormField(
                      autofocus: true,
                      controller: deviceName,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 12.r,
                        right: 12.r,

                        bottom: 5.r
                    ),
                    child: Row(
                      children: [
                        Text('الرقم التسلسلي للجهاز',style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                        boxShadow:[
                          BoxShadow(
                              color: colorShadowSearch.withOpacity(.26),
                              offset: Offset(0,4),
                              blurRadius: 10.0
                          )
                        ]
                    ),
                    child: TextFormField(
                      autofocus: true,
                      controller: deviceSerialNumber,
                      decoration: InputDecoration(
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.r),
                    width: Get.width,
                    height: Get.height / 3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('التقرير',style: TextStyle(
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius:
                                BorderRadius.only(
                                    bottomRight:
                                    Radius
                                        .circular(
                                        15.r),
                                    bottomLeft: Radius
                                        .circular(
                                        15.r)),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                      colorShadowSearch
                                          .withOpacity(
                                          .65),
                                      blurRadius: 10,
                                      offset:
                                      Offset(0, 4)),
                                ]),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Card(
                                      shadowColor:
                                      Colors.transparent,
                                      margin: EdgeInsets.zero,
                                      elevation: 0.0,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          IconButton(
                                              onPressed:
                                                  () {},
                                              icon: Icon(Icons
                                                  .delete_forever_outlined)),
                                          IconButton(
                                              onPressed:
                                                  () {
                                                Picker.pickerFile();
                                                  },
                                              icon: Icon(Icons
                                                  .attach_file_outlined)),
                                          IconButton(
                                              onPressed:
                                                  () {
                                                Picker.showChoiceDialog(context);
                                                  },
                                              icon: Icon(Icons
                                                  .camera_alt_outlined)),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                  flex: 4,
                                  child: Card(
                                    shadowColor: Colors
                                        .transparent,
                                    elevation: 0.0,
                                    color: Colors
                                        .transparent,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(
                                          10.r),
                                      child:
                                      TextFormField(
                                        onChanged: (val){
                                          controller.textReport=val;
                                        },
                                        maxLines: 3,
                                        textDirection:
                                        TextDirection
                                            .rtl,
                                        decoration:
                                        InputDecoration(
                                          border:
                                          InputBorder
                                              .none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      controller.deviceName=deviceName.text;
                      controller.deviceSerialNumber=deviceSerialNumber.text;
                      controller.deviceType=deviceType.text;
                      if(controller.check()){
                       sendAssignment();
                      Get.back();
                      Get.back();
                      }
                      else
                        Get.snackbar("Error", "complete details",backgroundColor: Colors.red,colorText: Colors.white);

                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.r),
                      margin: EdgeInsets.symmetric(
                        horizontal: Get.width/5,
                        vertical: 15.h,
                      ),
                      decoration: BoxDecoration(
                        color:  mainColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Text('تأكيد',style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp
                      ),),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddChangesController extends GetxController{
  var index = 0.obs;
  var index2 = 0.obs;
  var typeAdd = 'تركيبات'.obs;
  var listReply;
  String? deviceName,deviceType,deviceSerialNumber,textReport;
  Color buttonActive = mainColor;
  Color buttonActive2 = mainColor;
  Color textButtonActive = Colors.white;
  Color textButtonActive2 = Colors.white;
  bool check(){
    if(deviceName=="")return false;
    else if(deviceType=="")return false;
    else if(deviceSerialNumber=="")return false;
    else if(textReport=="")return false;
    else return true;
  }
  PageController? controllerPageView;
  Future<String> sendAssignment() async {
    listReply=FirebaseController.report["tracking"];
    listReply.add({
      "Time":expectedTime,
      "email":FirebaseController.email,
      "رقم التذكرة":FirebaseController.report["رقم البلاغ"],
      "نوع الحركة":"تركيب",
      "اسم الجهاز":deviceName,
      "نوع الجهاز":deviceType,
      "الرقم التسلسلي للجهاز":deviceSerialNumber,
      "مدخل التقرير":FirebaseController.name,
      "الحالة":"تحت الإجراء",
      "الوصف":"${textReport}",
      "notification":FirebaseController.notification,
    });
    print(FirebaseController.report.id);
    final send=await FirebaseFirestore.instance.collection("reports").doc(FirebaseController.report.id).update(
        {
          "tracking":listReply,
          "الحالة":"تحت الإجراء",
          "نوع الحركة":"تركيب",
          "notification":FirebaseController.notification,
        }).then((value){
      print("تم إضافة حركة");
      return "تم إضافة حركة";
    });
    if(send.isEmpty){
      print("لم يتم إضافة حركة");
      return "لم يتم إضافة حركة";
    }
    else{
      return "تم إضافة حركة";
    }

  }
  @override
  void onInit() {
    controllerPageView = PageController(
        initialPage: 0
    );
    super.onInit();
  }
  void onClickButton(val){
    index.value = val;
    print(index);
  }
  void onClickButton2(val){
    index2.value = val;
    print(index2);
  }

  var timeFrom = DateTime.now().obs;
  var timeTo = DateTime.now().obs;


  var technicalName = ''.obs;
  var  helperTechnical = ''.obs;

  DateTime expectedTime = DateTime.now();

  var dayTime = 0.obs;

  void changeDayTime(index){
    index == 0? dayTime.value =0:dayTime.value=1;
  }
}