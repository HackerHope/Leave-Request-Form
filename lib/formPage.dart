import 'package:flutter/material.dart';

class LeaveRequestForm extends StatefulWidget {
  const LeaveRequestForm({super.key});

  @override
  State<LeaveRequestForm> createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  // ===== Controllers =====
  final TextEditingController employeeNameCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();
  final TextEditingController nrcCtrl = TextEditingController();
  final TextEditingController supervisorCtrl = TextEditingController();
  final TextEditingController fromDateCtrl = TextEditingController();
  final TextEditingController toDateCtrl = TextEditingController();
  final TextEditingController reasonCtrl = TextEditingController();

  final TextEditingController leaveEntitlementCtrl = TextEditingController();
  final TextEditingController leaveEntitlementDaysCtrl =
      TextEditingController();
  final TextEditingController leaveBalanceCtrl = TextEditingController();
  final TextEditingController leaveBalanceDaysCtrl = TextEditingController();

  // ===== Checkbox states =====
  final Map<String, bool> absenceTypes = {
    'Sick': false,
    'Vacation': false,
    'Bereavement': false,
    'Time Off Without Pay': false,
    'Leave': false,
    'Maternity/Paternity': false,
    'Other': false,
  };

  // ===== Approval Checkboxes =====
  final Map<String, Map<String, bool>> approvals = {
    'Employee'
    'Supervisor': {'Approved': false, 'Rejected': false},
    'Director': {'Approved': false, 'Rejected': false},
    'HR': {'Approved': false, 'Rejected': false},
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Leave Request', style: TextStyle(color: Colors.green)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Absence Information =====
                sectionHeader('Absence Information'),
                const SizedBox(height: 10),

                buildRowField('Employee Name:', employeeNameCtrl),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(child: buildField('Location:', locationCtrl)),
                    const SizedBox(width: 10),
                    Expanded(child: buildField('NRC:', nrcCtrl)),
                  ],
                ),
                const SizedBox(height: 10),

                buildRowField('Supervisor:', supervisorCtrl),
                const SizedBox(height: 20),

                // ===== Absence Type =====
                const Text(
                  'Type of Absence Requested:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: -10,
                  children: absenceTypes.keys.map((type) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: absenceTypes[type],
                          onChanged: (val) {
                            setState(() {
                              absenceTypes[type] = val ?? false;
                            });
                          },
                        ),
                        Text(type),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // ===== Dates =====
                Row(
                  children: [
                    const Text('Dates of Absence: From  '),
                    Expanded(
                      child: TextField(
                        controller: fromDateCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('To  '),
                    Expanded(
                      child: TextField(
                        controller: toDateCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // ===== Reason =====
                const Text('Reason for Absence:'),
                const SizedBox(height: 5),
                TextField(
                  controller: reasonCtrl,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),

                // ===== Remaining Leave Allocation =====
                const SizedBox(height: 10),

                // ---- Table-like layout with fields ----
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Remaining Leave Allocation:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: leaveBalanceCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Working day(s):  '),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: leaveBalanceDaysCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Leave Entitlement:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: leaveEntitlementCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    const Text('Working day(s):  '),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: leaveEntitlementDaysCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        'Leave Balance:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: leaveBalanceCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Working day(s):  '),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: leaveBalanceDaysCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(border: Border.all(width: 1.0)),
                  child: const Text(
                    'You must submit requests for absences, other than sick leave, 5 working days prior to the first day you will be absent. Ensure an approved copy is kept by HR and keep a photocopy.',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(height: 20),

                // ===== Approval Section =====
                sectionHeader('Approval'),
                const SizedBox(height: 10),

                Table(
                  border: TableBorder.all(color: Colors.grey),
                  columnWidths: const {
                    0: FlexColumnWidth(1), // New first column
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                  },
                  children: [
                    // ===== Table Header =====
                    const TableRow(
                      decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Role',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Direct Supervisor',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Director',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'HR',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    // ===== Single Row for all approvals =====
                    TableRow(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Approval Status',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        buildApprovalColumn('Supervisor'),
                        buildApprovalColumn('Director'),
                        buildApprovalColumn('HR'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 20),

                const Text(
                  'Mukuba Pension House, 2nd Floor, 5309 Dedan Kimathi Road, Lusaka',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                ),
                const SizedBox(height: 30),

                // ===== Submit Button =====
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Form Submitted'),
                          content: Text(
                            'Employee: ${employeeNameCtrl.text}\n'
                            'Absence Type(s): ${absenceTypes.entries.where((e) => e.value).map((e) => e.key).join(', ')}\n'
                            'Reason: ${reasonCtrl.text}\n'
                            'Leave Entitlement: ${leaveEntitlementCtrl.text} (${leaveEntitlementDaysCtrl.text} days)\n'
                            'Leave Balance: ${leaveBalanceCtrl.text} (${leaveBalanceDaysCtrl.text} days)',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== Helper Widgets =====
  Widget sectionHeader(String title) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget buildRowField(String label, TextEditingController controller) {
    return Row(
      children: [
        Text('$label  '),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: UnderlineInputBorder()),
          ),
        ),
      ],
    );
  }

  Widget buildField(String label, TextEditingController controller) {
    return Row(
      children: [
        Text('$label  '),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: UnderlineInputBorder()),
          ),
        ),
      ],
    );
  }

  TableCell buildApprovalColumn(String role) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: approvals[role]!['Approved'],
                  onChanged: (val) {
                    setState(() {
                      approvals[role]!['Approved'] = val ?? false;
                      if (val == true) approvals[role]!['Rejected'] = false;
                    });
                  },
                ),
                const Text('Approved'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: approvals[role]!['Rejected'],
                  onChanged: (val) {
                    setState(() {
                      approvals[role]!['Rejected'] = val ?? false;
                      if (val == true) approvals[role]!['Approved'] = false;
                    });
                  },
                ),
                const Text('Rejected'),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Signature/Name:'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter signature/name',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 5),
            const Text('Date:'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'DD/MM/YYYY',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
