import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget{
  static const String id ='form_screen';
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final formKey = GlobalKey<FormState>();
  final myController = TextEditingController();//key for form
  TextEditingController dateController = TextEditingController();

  String? selectedMoney;
  String? expence;
  String? Amount1;
  String? Amount2;
  String? Description;
  String? Date;



  Widget _buildCurrency() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Currency'
      ),
      hint: const Text('Select Currency'),
      value: selectedMoney,

      onChanged: (currency) async {
        setState(() => selectedMoney = currency.toString());
        if(selectedMoney != null ){
          print(selectedMoney);  }
      },
      validator: (value) => value == null ? 'Required field' : null,

      items:
      ['Dollar','Rupee','euro','aed'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),

        );

      }).toList(),


    );
  }
  Widget _buildExpence() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Expence'
      ),

      hint: const Text('Select Expence'),
      value: expence,
      onChanged: (value) async {
        setState(() => expence = value.toString());
        if(expence != null ){
          print(expence);  }
      },
      items:
      ['food','garments','entertainment'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(value)
        );
      }).toList(),
    );}
  Widget _buildAmount1() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], // Only numbers can be entered
      maxLength: 6,

      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Amount",
          hintText:"Enter Amount"

      ),

      validator: (value){
        if(value!.isEmpty) {
          Amount1=value;
          return "Required field";
        }
        else {
          print(value);
          return null;
        }
      },
    );}
  Widget _buildAmount2() {
    return TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], // Only numbers can be entered
        maxLength: 6,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Amount",
            hintText:"Enter Amount"
        ),

        onChanged: (value) async {
          if(value != null ){
            Amount2=value;
          print(value);  }}

    );}
  Widget _buildDescription() {
    return TextFormField(

      minLines:3, // any number you need (It works as the rows for the textarea)
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Description",
          hintText:"Enter Description"
      ),
      onSaved: (value)  {

        if(value != null ){
          print(value);
        Description=value;
        }
      },
    );}
  Widget _buildDate() {
    return TextFormField(

     controller: dateController, 
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: " Date" ,
          hintText:"select date" ,
        suffixIcon: Icon(Icons.calendar_today), 
      ),
      readOnly: true,  // when true user cannot edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(), 
          firstDate: DateTime.now(), 
          lastDate: DateTime(2101),
        );

        if(pickedDate != null ){
         String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
         print(formattedDate);
          
          setState(() {
            dateController.text = formattedDate;
           Date= formattedDate;//set foratted date to TextField value.
          }
        );
        }
        
      },
      validator: (value){
        if(value!.isEmpty) {
          return "Required field";
        }
        else {
          return null;
        }
      },
    );}
  
  @override
  void initState() {
    myController.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
   myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child:

        CustomScrollView(slivers: [

          SliverToBoxAdapter(
            child:Form(
              key: formKey, //key for form
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(height:height*0.05),
                  _buildCurrency(),

                  SizedBox(height:height*0.05),
                  _buildExpence(),

                  SizedBox(height:height*0.05),
                  _buildAmount1(),

                  SizedBox(height:height*0.05),
                  _buildAmount2(),

                  SizedBox(height:height*0.05),
                  _buildDescription(),

                  SizedBox(height:height*0.05),
                  _buildDate(),
                  SizedBox(height:height*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ElevatedButton(onPressed: (){
                        if(formKey.currentState !.validate()){
                          formKey.currentState?.reset();

                          print('Submitting form');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        } },

                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                        ),  child: const Text("submit"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         ],
        ),
      ),
    );
  }
}
