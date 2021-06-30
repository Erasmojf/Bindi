import 'package:bindi/stores/edit_account_store.dart';
import 'package:bindi/stores/page_store.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccounScreen extends StatelessWidget {
  final EditAccountStore store = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return IgnorePointer(
                      ignoring: store.loading,
                      child: LayoutBuilder(builder: (_, constraints) {
                        return ToggleSwitch(
                          minWidth: constraints.biggest.width / 2.01,
                          labels: ['Particular', 'Prpfissional'],
                          cornerRadius: 20,
                          totalSwitches: 2,
                          inactiveBgColor: Colors.grey,
                          activeFgColor: Colors.white,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: store.userType.index,
                          onToggle: store.setUserType,
                        );
                      }),
                    );
                  }),
                  const SizedBox(height: 12),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: store.name,
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nome*',
                        errorText: store.nameError,
                      ),
                      onChanged: store.setName,
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: store.phone,
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Telefone*',
                        errorText: store.phoneError,
                      ),
                      onChanged: store.setPhone,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nova Senha',
                      ),
                      onChanged: store.setPass1,
                      obscureText: true,
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !store.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Confirmar nova Senha',
                        errorText: store.passError,
                      ),
                      onChanged: store.setPass2,
                      obscureText: true,
                    );
                  }),
                  const SizedBox(height: 12),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.orange,
                        disabledColor: Colors.orange.withAlpha(120),
                        disabledTextColor: Colors.white,
                        elevation: 0,
                        textColor: Colors.white,
                        child: store.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                'Salvar',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                        onPressed: store.savedPressed,
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.red,
                      elevation: 0,
                      textColor: Colors.white,
                      onPressed: () {
                        store.logout();
                        GetIt.I<PageStore>().setPage(0);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Sair',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
