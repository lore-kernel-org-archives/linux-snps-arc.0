From: peterz@infradead.org (Peter Zijlstra)
Date: Sat, 18 Jun 2016 12:17:40 +0200
Subject: cross compilers [was build failure of sorts]
In-Reply-To: <20160618070501.GC30154@twins.programming.kicks-ass.net>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com> <57645C16.9040300@synopsys.com>
 <20160618070501.GC30154@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160618101740.GN30927@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Sat, Jun 18, 2016@09:05:01AM +0200, Peter Zijlstra wrote:

> I use segher's buildall script.

> The buildall script I put to work and after about an hour I have however
> many of the 20+ targets that build with gcc.git and binutils.git cross
> compilers.
> 

Like the below...

(the native ones worked after I upgraded a lib and installed 32bit libs
because it wanted to build a multilib version)

As you can see, arc doesn't even build upstream binutils :/
(binutils-2_26-branch as of today).

/usr/local/src/buildall# time ./buildall --toolchain      
================== Primary platforms =========================
Building arm... (target arm-linux-gnueabi)
  binutils: configure [00:03] build [01:25] install [00:08]
       gcc: configure [00:04] build [01:14] install [00:12]
  OK
Building i386... (target i386-linux)
  binutils: configure [00:03] build [01:23] install [00:08]
       gcc: configure [00:03] build [01:22]  FAILED
Building mips... (target mips-linux)
  binutils: configure [00:05] build [01:26] install [00:08]
       gcc: configure [00:04] build [01:26] install [00:11]
  OK
Building mips64... (target mips64-linux)
  binutils: configure [00:03] build [01:29] install [00:07]
       gcc: configure [00:04] build [01:28] install [00:15]
  OK
Building powerpc... (target powerpc-linux)
  binutils: configure [00:03] build [01:36] install [00:07]
       gcc: configure [00:04] build [01:27] install [00:09]
  OK
Building powerpc64... (target powerpc64-linux)
  binutils: configure [00:03] build [01:37] install [00:08]
       gcc: configure [00:04] build [01:26] install [00:09]
  OK
Building sparc... (target sparc-linux)
  binutils: configure [00:03] build [01:21] install [00:08]
       gcc: configure [00:03] build [01:13] install [00:09]
  OK
Building sparc64... (target sparc64-linux)
  binutils: configure [00:03] build [01:23] install [00:08]
       gcc: configure [00:04] build [01:13] install [00:08]
  OK
Building x86_64... (target x86_64-linux)
  binutils: configure [00:03] build [02:16] install [00:09]
       gcc: configure [00:04]  FAILED
================== Secondary platforms =======================
Building arm64... (target aarch64-linux)
  binutils: configure [00:03] build [01:23] install [00:08]
       gcc: configure [00:04] build [01:12] install [00:20]
  OK
Building s390... (target s390-linux)
  binutils: configure [00:03] build [01:24] install [00:07]
       gcc: configure [00:04] build [02:03] install [00:09]
  OK
================== Tertiary platforms ========================
Building alpha... (target alpha-linux)
  binutils: configure [00:03] build [01:23] install [00:08]
       gcc: configure [00:04] build [01:10] install [00:08]
  OK
Building arc... (target arc-elf)
  binutils: configure [00:04] build [00:57]  FAILED
Building blackfin... (target bfin-uclinux)
  binutils: configure [00:02] build [01:27] install [00:08]
       gcc: configure [00:04] build [01:37] install [00:08]
  OK
Building c6x... (target c6x-elf)
  binutils: configure [00:03] build [01:24] install [00:07]
       gcc: configure [00:04] build [01:39]  FAILED
Building cris... (target cris-linux)
  binutils: configure [00:03] build [01:28] install [00:07]
       gcc: configure [00:04] build [01:11] install [00:09]
  OK
Building frv... (target frv-linux)
  binutils: configure [00:03] build [01:32] install [00:08]
       gcc: configure [00:04] build [01:10] install [00:10]
  OK
Building h8300... (target h8300-linux)
  binutils: configure [00:03] build [01:26] install [00:07]
       gcc: configure [00:04] build [01:17] install [00:09]
  OK
Building ia64... (target ia64-linux)
  binutils: configure [00:03] build [01:23] install [00:07]
       gcc: configure [00:04] build [01:10] install [00:08]
  OK
Building m32r... (target m32r-linux)
  binutils: configure [00:03] build [01:18]  FAILED
Building m68k... (target m68k-linux)
  binutils: configure [00:03] build [01:24] install [00:07]
       gcc: configure [00:04] build [01:17] install [00:09]
  OK
Building mn10300... (target am33_2.0-linux)
  binutils: configure [00:03] build [01:22] install [00:08]
       gcc: configure [00:04] build [01:08] install [00:08]
  OK
Building nios2... (target nios2-linux)
  binutils: configure [00:05] build [01:23] install [00:07]
       gcc: configure [00:05] build [01:10] install [00:08]
  OK
Building parisc... (target hppa-linux)
  binutils: configure [00:04] build [01:26] install [00:07]
       gcc: configure [00:04] build [01:12] install [00:08]
  OK
Building parisc64... (target hppa64-linux)
  binutils: configure [00:03] build [01:24] install [00:07]
       gcc: configure [00:05] build [01:11] install [00:08]
  OK
Building sh... (target sh4-linux)
  binutils: configure [00:04] build [01:27] install [00:07]
       gcc: configure [00:05] build [01:09] install [00:09]
  OK
Building shnommu... (target sh2-linux)
  binutils: configure [00:03] build [01:27] install [00:08]
       gcc: configure [00:04] build [01:15] install [00:08]
  OK
Building sh64... (target sh64-linux)
  binutils: configure [00:03] build [01:17]  FAILED
Building tile... (target tilegx-linux)
  binutils: configure [00:03] build [01:24] install [00:07]
       gcc: configure [00:04] build [01:32] install [00:09]
  OK
Building xtensa... (target xtensa-linux)
  binutils: configure [00:03] build [01:27] install [00:07]
       gcc: configure [00:05] build [01:09] install [00:08]
  OK
================== Imaginary platforms =======================
Building microblaze... (target microblaze-linux)
  binutils: configure [00:03] build [01:25] install [00:07]
       gcc: configure [00:05] build [01:27] install [00:09]
  OK

real    91m18.406s
user    376m21.856s
sys     50m34.916s
