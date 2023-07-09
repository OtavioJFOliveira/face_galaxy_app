import 'dart:convert';
import 'dart:io';
import 'package:dartssh2/dartssh2.dart';
import 'package:face_galaxy_app/main.dart';
import 'package:face_galaxy_app/services/variables.dart';
import 'package:face_galaxy_app/pages/lgConnection.dart';


void ssh(command) async {

  final client = SSHClient(
    await SSHSocket.connect(lgIP, sshPort),
    username: username,
    onPasswordRequest: () => password,
  );

  final uptime = await client.run(command);
  print(utf8.decode(uptime));

  client.close();
  await client.done;
}