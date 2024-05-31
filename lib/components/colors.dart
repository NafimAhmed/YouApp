import 'package:flutter/material.dart';

const Color HOME_COLOR = Color(0xff09141A);
const Color GRADIENT1 = Color(0xff1F4247);
const Color GRADIENT2 = Color(0xff0D1D23);
const Color GRADIENT3 = Color(0xff09141A);

const Color GRADIENT4 = Color(0xff62CDCB);
const Color GRADIENT5 = Color(0xff4599DB);

const Gradient buttonDisableGradiant = LinearGradient(colors: [GRADIENT4, GRADIENT5]);

const Decoration loginDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [GRADIENT3, GRADIENT2, GRADIENT1]));
