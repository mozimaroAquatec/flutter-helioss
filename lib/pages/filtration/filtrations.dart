import 'package:flutter/material.dart';
import 'package:helioss/logging/logging.dart';
import 'package:helioss/api/helioss_api.dart';
import 'package:helioss/models/helioss_model.dart';
import 'package:logger/logger.dart';

class Filtrations extends StatefulWidget {
  const Filtrations({super.key});
  @override
  State<Filtrations> createState() => _Filtration();
}

class _Filtration extends State<Filtrations> {
  final Logger log = logger;
  late HeliossServices helioss;
  late HeliossInterface? lastFiltration = null;

  @override
  void initState() {
    super.initState();
    helioss = HeliossServices();

    getLastFiltration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "filtration page",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Card(
        child: ListTile(
          title: Text(lastFiltration != null
              ? 'last filtration :${lastFiltration?.filtration}'
              : 'last filtration : wating'),
          leading: Icon(Icons.filter_alt_outlined),
          subtitle: Text(lastFiltration != null
              ? "date : ${lastFiltration?.date}"
              : "date : wating"),
        ),
      ),
    );
  }

  Future<void> getLastFiltration() async {
    HeliossInterface value = await helioss.getLastFiltration();

    setState(() {
      lastFiltration = value;
      log.i("lastFiltration $lastFiltration");
      log.i("lastFiltration filtration  :${lastFiltration?.filtration}");
    });
  }
}
