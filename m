From: acme@kernel.org (Arnaldo Carvalho de Melo)
Date: Thu, 18 Aug 2016 17:40:51 -0300
Subject: [GIT PULL 0/3] perf/urgent fixes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471552854-26972-1-git-send-email-acme@kernel.org>
To: linux-snps-arc@lists.infradead.org

Hi Ingo,

	Please consider pulling,

- Arnaldo

Build stats at the end of this message.

The following changes since commit 3cace81ea5bb0b3f2b97cab8e2c8e1fae2feb7ed:

  Merge tag 'perf-urgent-for-mingo-20160815' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/urgent (2016-08-16 20:08:56 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-urgent-for-mingo-20160818

for you to fetch changes up to c53412ee8c7ec31373a4176ff7f3a6b79296c05c:

  perf evsel: Do not access outside hw cache name arrays (2016-08-18 16:39:46 -0300)

----------------------------------------------------------------
perf/urgent fixes:

- Do not access outside hw cache name arrays (Arnaldo Carvalho de Melo)

- Use addr_location::addr instead of ip for entries when unwinding using
  DWARF CFI, fixing the "srcline" information for userspace application
  callchains (Milian Wolff)

- Reinstate strlcpy() header guard with __UCLIBC__, fixing the build
  with uclibc, detected when building for the ARC architecture (Vineet Gupta)

Signed-off-by: Arnaldo Carvalho de Melo <acme at redhat.com>

----------------------------------------------------------------
Arnaldo Carvalho de Melo (1):
      perf evsel: Do not access outside hw cache name arrays

Milian Wolff (1):
      perf unwind: Use addr_location::addr instead of ip for entries

Vineet Gupta (1):
      tools lib: Reinstate strlcpy() header guard with __UCLIBC__

 tools/include/linux/string.h             | 6 +++++-
 tools/perf/util/evsel.c                  | 6 +++---
 tools/perf/util/unwind-libdw.c           | 2 +-
 tools/perf/util/unwind-libunwind-local.c | 2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

Build stats, now only android-ndk doesn't build with NO_LIBELF=1, as it
doesn't even have libelf to cross build with, and the non-cross builds
build objtool, uClibc and an ARC architecture cross build image are in
the works:

  # time dm
   1 77.199181517 alpine:3.4: Ok
   2 30.215940343 android-ndk:r12b-arm: Ok
   3 80.593965325 archlinux:latest: Ok
   4 45.102186377 centos:5: Ok
   5 67.078635441 centos:6: Ok
   6 73.582617061 centos:7: Ok
   7 65.462644128 debian:7: Ok
   8 69.919139691 debian:8: Ok
   9 77.192563446 debian:experimental: Ok
  10 80.651363745 fedora:20: Ok
  11 85.566954259 fedora:21: Ok
  12 87.547437162 fedora:22: Ok
  13 94.866327046 fedora:23: Ok
  14 93.829320269 fedora:24: Ok
  15 94.860933711 fedora:rawhide: Ok
  16 88.890456556 mageia:5: Ok
  17 85.622890293 opensuse:13.2: Ok
  18 87.232034972 opensuse:42.1: Ok
  19 94.807172866 opensuse:tumbleweed: Ok
  20 72.189153053 ubuntu:12.04.5: Ok
  21 86.275708891 ubuntu:14.04.4: Ok
  22 90.743742216 ubuntu:15.10: Ok
  23 86.931085419 ubuntu:16.04: Ok
  24 67.823595709 ubuntu:16.04-x-arm: Ok
  25 62.985390761 ubuntu:16.04-x-arm64: Ok
  26 64.727635984 ubuntu:16.04-x-powerpc64: Ok
  27 63.208264990 ubuntu:16.04-x-powerpc64el: Ok
  28 64.685772233 ubuntu:16.04-x-s390: Ok
  29 85.089091168 ubuntu:16.10: Ok
   2224.88s

  real	37m6.200s
  user	0m1.830s
  sys	0m2.653s
  #
