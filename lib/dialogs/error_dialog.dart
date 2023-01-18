import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ErrorDialog extends StatefulWidget {
  String message;
  Function() okay;
  bool error;
  bool isEnglish;
  bool withCancel;
  Function()? cancelFunction;
  ErrorDialog(this.message, this.okay, this.error, this.isEnglish,
      {Key? key, this.withCancel = false, this.cancelFunction})
      : super(key: key);
  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: SizedBox(
        // height: ScreenUtil().setHeight(869.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(129.1),
                bottom: ScreenUtil().setHeight(45.5),
              ),
              child: SizedBox(
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setHeight(100),
                child: widget.error
                    ? Image.asset("assets/images/attention.png")
                    : Image.asset("assets/images/successful.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(65.5),
              ),
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: widget.isEnglish ? "roboto" : "gedinar",
                      height: 1,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20)),
                ),
              ),
            ),
            if (widget.withCancel)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(43)),
                    child: InkWell(
                      onTap: widget.cancelFunction,
                      child: Container(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setSp(120),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10000),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: ScreenUtil().setHeight(20),
                            // width: ScreenUtil().setHeight(134),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily:
                                      widget.isEnglish ? "roboto" : "gedinar",
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: ScreenUtil().setHeight(43)),
                    child: InkWell(
                      onTap: widget.okay,
                      child: Container(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setSp(120),
                        decoration: BoxDecoration(
                          color:Colors.blue,
                          borderRadius: BorderRadius.circular(10000),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: ScreenUtil().setHeight(20),
                            // width: ScreenUtil().setHeight(134),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                'Okay',
                                style: TextStyle(
                                  fontFamily:
                                      widget.isEnglish ? "roboto" : "gedinar",
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (!widget.withCancel)
              Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(43)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: widget.okay,
                      child: Container(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setSp(200),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10000),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: ScreenUtil().setHeight(20),
                            // width: ScreenUtil().setHeight(134),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                'Okay',
                                style: TextStyle(
                                  fontFamily:
                                      widget.isEnglish ? "roboto" : "gedinar",
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}