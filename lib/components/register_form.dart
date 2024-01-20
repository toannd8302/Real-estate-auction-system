import 'package:flutter/material.dart';

class RegisterSection extends StatelessWidget {
  final int activeStepIndex;
  final Function onStepContinue;
  final Function onStepCancel;
  final Function onStepTapped;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController addressController;
  final TextEditingController pincodeController;

  RegisterSection({
    required this.activeStepIndex,
    required this.onStepContinue,
    required this.onStepCancel,
    required this.onStepTapped,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.addressController,
    required this.pincodeController,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: activeStepIndex,
            steps: [
              Step(
                state: activeStepIndex >= 0
                    ? StepState.complete
                    : StepState.editing,
                isActive: activeStepIndex >= 0,
                title: const Text('Account'),
                content: buildAccountStep(),
              ),
              Step(
                state: activeStepIndex >= 1
                    ? StepState.complete
                    : StepState.editing,
                isActive: activeStepIndex >= 1,
                title: const Text('Address'),
                content: buildAddressStep(),
              ),
              Step(
                state: StepState.complete,
                isActive: activeStepIndex >= 2,
                title: const Text('Confirm'),
                content: buildConfirmStep(),
              ),
            ],
            onStepContinue: onStepContinue as void Function(),
            onStepCancel: onStepCancel as void Function(),
            onStepTapped: onStepTapped as void Function(int),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = activeStepIndex == 2;
              return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: isLastStep
                          ? const Text('Submit')
                          : const Text('Next'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (activeStepIndex > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text('Back'),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAccountStep() {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: passController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddressStep() {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: addressController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full House Address',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: pincodeController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pin Code',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConfirmStep() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Name: ${nameController.text}'),
          Text('Email: ${emailController.text}'),
          const Text('Password: *****'),
          Text('Address : ${addressController.text}'),
          Text('PinCode : ${pincodeController.text}'),
        ],
      ),
    );
  }
}
