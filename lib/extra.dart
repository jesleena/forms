TextFormField(
decoration: InputDecoration(
labelText: "Enter your First Name"
),
validator: (value){
if(value!.isEmpty || !RegExp(r'^[A-Za-z]+$').hasMatch(value!)) {
return "Enter correct name";
}
else {
return null;
}
},
),


SizedBox(height:height*0.05),
TextFormField(
decoration: InputDecoration(
labelText: "Enter your Second Name"
),
validator: (value){
if(value!.isEmpty || !RegExp(r'^[A-Za-z]+$').hasMatch(value!)) {
return "Enter correct name";
}
else {
return null;
}
},
),


SizedBox(height:height*0.05),
TextFormField(

decoration: InputDecoration(
labelText: "Enter your phno"
),
validator: (value){
if(value!.isEmpty||!RegExp(r'^((\+91)?|91)?[789][0-9]{9}').hasMatch(value!)) {
return "Enter correct phno";
}
else {
return null;
}
},
),

SizedBox(height:height*0.05),
TextFormField(

// maxLengthEnforced: true,
// controller: overall,
//decoration: InputDecoration(
//  hintText: "Overall Rating  Out of /10",
// ),
decoration: InputDecoration(
labelText: "Enter your email"
),
validator: (value){
if(value!.isEmpty||!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(value!)) {
return "Enter correct email id";
}
else {
return null;
}
},
),
