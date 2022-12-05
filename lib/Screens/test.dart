import 'dart:io';

void main(List<String> args) {
  for (int i = 1; i < 3; i++) {
    for (int j = 1; j < i; j++) {
      for (int k = 1; k < i; k++) {
        stdout.write('*');
      }
    }
  }
}
