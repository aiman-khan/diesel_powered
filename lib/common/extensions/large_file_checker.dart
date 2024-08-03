extension FileSize on num {
  bool isMoreThan5MBs() {
    if (this > 5 * 1024 * 1024) {
      return true;
    }
    return false;
  }
}
