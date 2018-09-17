From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 18 Sep 2018 00:29:33 +0300
Subject: [PATCH 00/10] Introduce ARC port of OpenEmbedded
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180917212943.27237-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

DesignWare ARC Processors are a family of 32-bit CPUs from Synopsys.
This series introduces basic support for ARC architecture in
OpenEmbedded.

As of today latest upstream GCC and Binutils are perfectly usable
for building packages for ARC so we just need a couple of fixes.

Glibc for ARC is under review and we're working hard to get it
accepted in the next upstream release. For now we'll use latest
code-base back-ported on top of 2.28 release via meta-synopsys.

More platform and architecture specific bits could be found in
meta-synopsys layer here (please refer to the "master" branch):
https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys

Alexey Brodkin (8):
  siteinfo: Define data for ARC
  site: Add ARC linux
  kernel-arch.bbclass: Add ARC to kernel arch map
  openssl: Add support for ARC
  icu: Add ARC support
  gcc: Disable libitm for ARC
  binutils: Fix Glibc building for ARC
  gcc: Fix specs generation for ARC

Antoine Tenart (1):
  nspr: Add ARC support

Mylene Josserand (1):
  libgpg-error: Add ARC support

 meta/classes/kernel-arch.bbclass                   |   1 +
 meta/classes/siteinfo.bbclass                      |   2 +
 .../openssl/openssl10_1.0.2p.bb                    |   2 +-
 .../openssl/openssl_1.1.1-pre9.bb                  |   2 +-
 meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
 ...location-where-GOT-information-is-collect.patch | 198 +++++++++++++++++++++
 ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  35 ++++
 ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  43 +++++
 ...tion-was-still-being-generated-when-symbo.patch |  37 ++++
 meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        |  40 +++++
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   1 +
 .../icu/icu/0002-Add-ARC-support.patch             |  25 +++
 meta/recipes-support/icu/icu_62.1.bb               |   1 +
 .../0001-syscfg-Add-an-arc-architecture.patch      |  75 ++++++++
 .../libgpg-error/libgpg-error_1.32.bb              |   1 +
 .../nspr/nspr/0004-Add-ARC-support.patch           |  86 +++++++++
 meta/recipes-support/nspr/nspr_4.19.bb             |   1 +
 meta/site/arc-linux                                |  11 ++
 19 files changed, 564 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
 create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-architecture.patch
 create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
 create mode 100644 meta/site/arc-linux

-- 
1.8.3.1
