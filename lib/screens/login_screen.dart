import 'package:flutter/material.dart';
import 'package:odin/providers/providers.dart';
import 'package:odin/services/auth_service.dart';

import 'package:provider/provider.dart';

import 'package:odin/theme/app_themes.dart';
import 'package:odin/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthBackground(
        textTitle: 'Welcome Back',
        textSubtitle: 'Dolore reprehenderit ut eiusmod duis officia magna ullamco adipisicing cillum.',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.4,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                width: double.infinity,
                // color: Colors.red,
                child: Column(
                  children: [
                    
                    ChangeNotifierProvider(
                      create: (BuildContext context) => LoginFormProvider(),
                      child: _LoginForm()
                      ),

                    SizedBox(height: 40,),

                    _CreateAccount()

                  ],
                ),

              )
            ],
          ),
        ),
      )
    );
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [

          const Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 16, color: Colors.grey),),
          
          const SizedBox(height: 20,),

          MaterialButton(
            color: Color(0xffececec),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              child: const Text(
                'CREATE AN ACCOUNT',
                style: TextStyle(fontSize: 16),
                )
              ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, 'createAccount');
            }  
          ),

          const SizedBox(height: 10,)
        
        ],
      ),);
  }
}

class _LoginForm extends StatelessWidget {

  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: _FormBoxDecoration(),
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
              
            CustomerInputField(
              autofocus: true,
              hintText: 'Erick',
              labelText: 'User',
              icon: Icons.person_outline_rounded,
              onChange: (value) => loginForm.email = value,
            ),

            const SizedBox(height: 20,),

            CustomerInputField(
              hintText: '****',
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
              onChange: (value) => loginForm.password = value,
              validator: (value){
                if(value == null) return 'Nulo';
                return value.length < 6 ? 'Mas de 6 caracteres' : null;
              },
            ),

            const SizedBox(height: 20,),

            MaterialButton(
              color: AppThemes.colorPrimary,
              disabledColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 16),)
                ),
              onPressed: loginForm.isLoading ? null : () async { 
                FocusScope.of(context).requestFocus( FocusNode() );
                final authService = Provider.of<AuthService>(context, listen: false);

                if(!loginForm.isValidate() ) return;

                loginForm.isLoading = true;

                final errorMessage = await authService.login(loginForm.email, loginForm.password);

                if(errorMessage == null){
                  Navigator.pushNamed(context, 'drawer');
                }else{
                  print(errorMessage);
                  loginForm.isLoading = false;
                }

               },
            ),

          
          ],
        ),
      ),
    );
  }

  BoxDecoration _FormBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 10)
      )
    ]);
  
}

