Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAB5C0218A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAd4vEc6JDoEOibWbXhmHob/I2BJ0VQXTXQ7/ZpF5K8=; b=Mgm40YbzDdcWGr
	5uET0+No1Fje54BZOpAq9AVOsq47yqn461zEoiNTpZEK2BXVWXc0c2mXSYa46bqeQeHTJzCbYGFVk
	GjJV27yOeEbpRKIPmJyyX4G+MMHmWWIxm2XXBcbNxRC+Vxhrw05XrZHJCcJtP/BawKEiCO23o3MJi
	3OAS2UMBt/bjlQj5OuKci9+U1245ZRqRzZGsSEROIFGOS2fL1O28eohW7fSqBa8vTzqEEYKJ1W7h4
	PF8c8C4y/CnkhnBNLHz2khDy4A5GhjWStLpOyeLIWwXjUaTrZXHEUNv0eJmlye7n4myDGi+YT3ojp
	acBXJcDtD72EfPi1lT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoW7-00000005Koe-0KzH;
	Tue, 28 Jan 2025 16:32:47 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoPK-00000005JRY-03Fa;
	Tue, 28 Jan 2025 16:25:47 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2308C72C8CC;
	Tue, 28 Jan 2025 19:25:45 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0E2917CCB3A; Tue, 28 Jan 2025 18:25:45 +0200 (IST)
Date: Tue, 28 Jan 2025 18:25:44 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-snps-arc@lists.infradead.org,
	Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
	linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	strace-devel@lists.strace.io, linux-arch@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Frysinger <vapier@gentoo.org>,
	Davide Berardi <berardi.dav@gmail.com>,
	Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
	loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexey Gladkov <legion@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 3/6] syscall.h: introduce syscall_set_nr()
Message-ID: <20250128162544.GE11869@strace.io>
References: <20250128091636.GC8601@strace.io>
 <e76df471-1346-459a-9f24-fa053d7dcbe8@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e76df471-1346-459a-9f24-fa053d7dcbe8@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_082546_382770_80078A28 
X-CRM114-Status: GOOD (  25.84  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMDQ6MTM6NTJQTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiBMZSAyOC8wMS8yMDI1IMOgIDEwOjE2LCBEbWl0cnkgVi4gTGV2aW4gYSDDqWNy
aXTCoDoKPiA+IFNpbWlsYXIgdG8gc3lzY2FsbF9zZXRfYXJndW1lbnRzKCkgdGhhdCBjb21wbGVt
ZW50cwo+ID4gc3lzY2FsbF9nZXRfYXJndW1lbnRzKCksIGludHJvZHVjZSBzeXNjYWxsX3NldF9u
cigpCj4gPiB0aGF0IGNvbXBsZW1lbnRzIHN5c2NhbGxfZ2V0X25yKCkuCj4gPiAKPiA+IHN5c2Nh
bGxfc2V0X25yKCkgaXMgZ29pbmcgdG8gYmUgbmVlZGVkIGFsb25nIHdpdGgKPiA+IHN5c2NhbGxf
c2V0X2FyZ3VtZW50cygpIG9uIGFsbCBIQVZFX0FSQ0hfVFJBQ0VIT09LCj4gPiBhcmNoaXRlY3R1
cmVzIHRvIGltcGxlbWVudCBQVFJBQ0VfU0VUX1NZU0NBTExfSU5GTyBBUEkuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IERtaXRyeSBWLiBMZXZpbiA8bGR2QHN0cmFjZS5pbz4KPiA+IFRlc3RlZC1i
eTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IFJldmlld2VkLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgIGFy
Y2gvYXJjL2luY2x1ZGUvYXNtL3N5c2NhbGwuaCAgICAgICAgfCAxMSArKysrKysrKysrKwo+ID4g
ICBhcmNoL2FybS9pbmNsdWRlL2FzbS9zeXNjYWxsLmggICAgICAgIHwgMjQgKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiAgIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICAg
fCAxNiArKysrKysrKysrKysrKysrCj4gPiAgIGFyY2gvaGV4YWdvbi9pbmNsdWRlL2FzbS9zeXNj
YWxsLmggICAgfCAgNyArKysrKysrCj4gPiAgIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3N5
c2NhbGwuaCAgfCAgNyArKysrKysrCj4gPiAgIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9zeXNjYWxs
LmggICAgICAgfCAgNyArKysrKysrCj4gPiAgIGFyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9z
eXNjYWxsLmggfCAgNyArKysrKysrCj4gPiAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9zeXNjYWxs
LmggICAgICAgfCAxNCArKysrKysrKysrKysrKwo+ID4gICBhcmNoL25pb3MyL2luY2x1ZGUvYXNt
L3N5c2NhbGwuaCAgICAgIHwgIDUgKysrKysKPiA+ICAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2Fz
bS9zeXNjYWxsLmggICB8ICA2ICsrKysrKwo+ID4gICBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9z
eXNjYWxsLmggICAgIHwgIDcgKysrKysrKwo+ID4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
c3lzY2FsbC5oICAgIHwgMTAgKysrKysrKysrKwo+ID4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3N5c2NhbGwuaCAgICAgIHwgIDcgKysrKysrKwo+ID4gICBhcmNoL3MzOTAvaW5jbHVkZS9hc20v
c3lzY2FsbC5oICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gPiAgIGFyY2gvc2gvaW5jbHVkZS9h
c20vc3lzY2FsbF8zMi5oICAgICAgfCAxMiArKysrKysrKysrKysKPiA+ICAgYXJjaC9zcGFyYy9p
bmNsdWRlL2FzbS9zeXNjYWxsLmggICAgICB8IDEyICsrKysrKysrKysrKwo+ID4gICBhcmNoL3Vt
L2luY2x1ZGUvYXNtL3N5c2NhbGwtZ2VuZXJpYy5oIHwgIDUgKysrKysKPiA+ICAgYXJjaC94ODYv
aW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICAgICB8ICA3ICsrKysrKysKPiA+ICAgYXJjaC94dGVu
c2EvaW5jbHVkZS9hc20vc3lzY2FsbC5oICAgICB8ICA3ICsrKysrKysKPiA+ICAgaW5jbHVkZS9h
c20tZ2VuZXJpYy9zeXNjYWxsLmggICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gPiAgIDIw
IGZpbGVzIGNoYW5nZWQsIDE5NyBpbnNlcnRpb25zKCspCj4gPiAKPiAKPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3N5c2NhbGwuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vc3lzY2FsbC5oCj4gPiBpbmRleCA3NjAyMGI2NjI4NmIuLjcxMmRhYTkwZTY0MyAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc3lzY2FsbC5oCj4gPiArKysgYi9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3N5c2NhbGwuaAo+ID4gQEAgLTYxLDYgKzYxLDIyIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBzeXNjYWxsX3NldF9yZXR1cm5fdmFsdWUoc3RydWN0IHRhc2tfc3RydWN0
ICp0YXNrLAo+ID4gICAJcmVncy0+cmVnc1swXSA9IHZhbDsKPiA+ICAgfQo+ID4gICAKPiA+ICtz
dGF0aWMgaW5saW5lIHZvaWQgc3lzY2FsbF9zZXRfbnIoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNr
LAo+ID4gKwkJCQkgIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ID4gKwkJCQkgIGludCBucikKPiA+
ICt7Cj4gPiArCXJlZ3MtPnN5c2NhbGxubyA9IG5yOwo+ID4gKwlpZiAobnIgPT0gLTEpIHsKPiA+
ICsJCS8qCj4gPiArCQkgKiBXaGVuIHRoZSBzeXNjYWxsIG51bWJlciBpcyBzZXQgdG8gLTEsIHRo
ZSBzeXNjYWxsIHdpbGwgYmUKPiA+ICsJCSAqIHNraXBwZWQuICBJbiB0aGlzIGNhc2UgdGhlIHN5
c2NhbGwgcmV0dXJuIHZhbHVlIGhhcyB0byBiZQo+ID4gKwkJICogc2V0IGV4cGxpY2l0bHksIG90
aGVyd2lzZSB0aGUgZmlyc3Qgc3lzY2FsbCBhcmd1bWVudCBpcwo+ID4gKwkJICogcmV0dXJuZWQg
YXMgdGhlIHN5c2NhbGwgcmV0dXJuIHZhbHVlLgo+ID4gKwkJICovCj4gPiArCQlzeXNjYWxsX3Nl
dF9yZXR1cm5fdmFsdWUodGFzaywgcmVncywgLUVOT1NZUywgMCk7Cj4gPiArCX0KPiA+ICt9Cj4g
PiArCj4gPiAgICNkZWZpbmUgU1lTQ0FMTF9NQVhfQVJHUyA2Cj4gPiAgIAo+ID4gICBzdGF0aWMg
aW5saW5lIHZvaWQgc3lzY2FsbF9nZXRfYXJndW1lbnRzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFz
aywKPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3lzY2FsbC5o
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N5c2NhbGwuaAo+ID4gaW5kZXggNTIxZjI3OWU2
YjMzLi43NTA1ZGNmZWQyNDcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vc3lzY2FsbC5oCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc3lzY2FsbC5o
Cj4gPiBAQCAtMzksNiArMzksMTYgQEAgc3RhdGljIGlubGluZSBpbnQgc3lzY2FsbF9nZXRfbnIo
c3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICAgCQly
ZXR1cm4gLTE7Cj4gPiAgIH0KPiA+ICAgCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHN5c2NhbGxf
c2V0X25yKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGlu
dCBucikKPiA+ICt7Cj4gPiArCS8qCj4gPiArCSAqIFVubGlrZSBzeXNjYWxsX2dldF9ucigpLCBz
eXNjYWxsX3NldF9ucigpIGNhbiBiZSBjYWxsZWQgb25seSB3aGVuCj4gPiArCSAqIHRoZSB0YXJn
ZXQgdGFzayBpcyBzdG9wcGVkIGZvciB0cmFjaW5nIG9uIGVudGVyaW5nIHN5c2NhbGwsIHNvCj4g
PiArCSAqIHRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSB0aGUgc2FtZSBjaGVjayBzeXNjYWxsX2dl
dF9ucigpIGhhcy4KPiA+ICsJICovCj4gPiArCXJlZ3MtPmdwclswXSA9IG5yOwo+IAo+IERvZXNu
J3QgdGhlIHNhbWUgYXMgZm9yIEFSTTY0IGFwcGx5IGhlcmUgYXMgd2VsbCA/CgpJIGNhcmVmdWxs
eSBjaGVja2VkIGFsbCBhZmZlY3RlZCBhcmNoaXRlY3R1cmVzIGFuZCBhZGRlZCB0aGF0CnN5c2Nh
bGxfc2V0X3JldHVybl92YWx1ZSgpIGNhbGwgb25seSB3aGVyZSBJIHRoaW5rIGl0J3MgbmVlZGVk
LgoKT24gcG93ZXJwYyBpdCdzIG5vdCBuZWVkZWQgd2l0aCB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbjogdGhlaXIKZG9fc2VjY29tcCgpIHNldHMgLUVOT1NZUyBiZWZvcmUgX19zZWN1cmVfY29t
cHV0aW5nKCkgaW52b2NhdGlvbiwgYW5kCnRoZWlyIGRvX3N5c2NhbGxfdHJhY2VfZW50ZXIoKSBz
ZXRzIC1FTk9TWVMgaW4gY2FzZSBvZiBhbiBpbnZhbGlkIHN5c2NhbGwKbnVtYmVyLgoKCi0tIAps
ZHYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
