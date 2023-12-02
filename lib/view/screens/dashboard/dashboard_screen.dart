import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/view_model/trx_view_model.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {


  @override
  void didChangeDependencies() {
    ref.watch(trxViewModel).getTransactions();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
