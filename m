Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58329CED26F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Oct 2024 06:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cz+d4VCL4u0gwSHTJ+jRZbdX96N0Fyl01wiBPrU6EiM=; b=egD9kBGBnU9b2O
	0lNsxr+eQbG3qwpjyORRjmVhVFS5yQomyqmH+v5dCuqLtK4F6aBjCtwruXhwG+xvwMslam8H84gXJ
	neZ3UWqcJoxL2KoPxBFlhn0Ygd1Oal9bhYA36g75cxaZ7Z8wZym/J8ompp0BKdOqT+fMQKLU9oVBg
	V7GndzUc2EqH5zNg6zjTE+I8CnEzA2kzYwUz8E7XsnhVTiIQqKp13qfK9o7kpt0fu4PYVmvE2WNiz
	/Z01vd95gYdtIIrjBT6lvuk6AvWCUdSJvV3dSPxvB/YOnFpzOArYcV6ib8GsDh4cmXPRt8Ciz8B4a
	EVpoVdbqWUJnAojxmJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3dB-00000004diq-3ORF;
	Tue, 08 Oct 2024 06:23:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy3cc-00000004dYy-3nWm;
	Tue, 08 Oct 2024 06:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F05D1A43229;
	Tue,  8 Oct 2024 06:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C076C4CEC7;
	Tue,  8 Oct 2024 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728368581;
	bh=7+OOlYDwjjrmYkugp0zG3rCIOBJXVhabkZlBvijiN0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLZ7O/HpKqwZhtBX1cNCiAk8EV6vD0WzAl1dR/RILMS7jSHhGDnYDNH2Dzn6ECEly
	 M0+GSr/JGL8nAopaejPjKSQKa6Jmnx6kHabKvo9FyggKvIK/+rwoLnO5mphSBOrVi8
	 U9wdgL7Nl7zM0jbSh9FiGcxw5b5J+su+JR+7Gf4XG9wvT3v6GVYlXJH8m3l11OFKZ1
	 9jEHuFYuJh2kBStvb3JCpXCoRR3L/JiHNjMlM70jCbMyIiQEwYJp2wijiSZ4G1su3J
	 9j8W/sm+G2yCx41UsRZ1DC/eNueJYqT+Lq5WzrcGaGCVNkuw9bP/AltQfceSnkaSt6
	 lK+siW3UD/EyQ==
Date: Tue, 8 Oct 2024 09:19:13 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 5/8] arch: introduce set_direct_map_valid_noflush()
Message-ID: <ZwTO4S_smfPbP06x@kernel.org>
References: <20241007062858.44248-1-rppt@kernel.org>
 <20241007062858.44248-6-rppt@kernel.org>
 <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H4u5qk-Zd8ctiooCv_hGKbDpXRAtTZMMsUab9bbLAnd5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_232303_225392_EAA40D24 
X-CRM114-Status: GOOD (  21.80  )
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

SGkgSHVhY2FpLAoKT24gVHVlLCBPY3QgMDgsIDIwMjQgYXQgMTA6MTE6MjVBTSArMDgwMCwgSHVh
Y2FpIENoZW4gd3JvdGU6Cj4gSGksIE1pa2UsCj4gCj4gT24gTW9uLCBPY3QgNywgMjAyNCBhdCAy
OjMw4oCvUE0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBG
cm9tOiAiTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSIgPHJwcHRAa2VybmVsLm9yZz4KPiA+Cj4g
PiBBZGQgYW4gQVBJIHRoYXQgd2lsbCBhbGxvdyB1cGRhdGVzIG9mIHRoZSBkaXJlY3QvbGluZWFy
IG1hcCBmb3IgYSBzZXQgb2YKPiA+IHBoeXNpY2FsbHkgY29udGlndW91cyBwYWdlcy4KPiA+Cj4g
PiBJdCB3aWxsIGJlIHVzZWQgaW4gdGhlIGZvbGxvd2luZyBwYXRjaGVzLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KPiA+
IC0tLQo+ID4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oICAgICB8ICAxICsK
PiA+ICBhcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMgICAgICAgICAgICAgICAgfCAxMCArKysrKysr
KysrCj4gPiAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oIHwgIDEgKwo+
ID4gIGFyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMgICAgICAgICAgICB8IDIxICsrKysrKysr
KysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oICAg
ICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L21tL3BhZ2VhdHRyLmMgICAgICAgICAgICAgICAgfCAx
NSArKysrKysrKysrKysrKysKPiA+ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5o
ICAgICAgfCAgMSArCj4gPiAgYXJjaC9zMzkwL21tL3BhZ2VhdHRyLmMgICAgICAgICAgICAgICAg
IHwgMTEgKysrKysrKysrKysKPiA+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5Lmgg
ICAgICAgfCAgMSArCj4gPiAgYXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYyAgICAgICAgICAg
IHwgIDggKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L3NldF9tZW1vcnkuaCAgICAgICAgICAg
ICAgfCAgNiArKysrKysKPiA+ICAxMSBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3NldF9tZW1vcnku
aCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+ID4gaW5kZXggZDcw
NTA1YjY2NzZjLi41NWRmYWVmZDAyYzggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9p
bmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPiA+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUv
YXNtL3NldF9tZW1vcnkuaAo+ID4gQEAgLTE3LDUgKzE3LDYgQEAgaW50IHNldF9tZW1vcnlfcnco
dW5zaWduZWQgbG9uZyBhZGRyLCBpbnQgbnVtcGFnZXMpOwo+ID4gIGJvb2wga2VybmVsX3BhZ2Vf
cHJlc2VudChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gPiAgaW50IHNldF9kaXJlY3RfbWFwX2RlZmF1
bHRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gPiAgaW50IHNldF9kaXJlY3RfbWFwX2lu
dmFsaWRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gPiAraW50IHNldF9kaXJlY3RfbWFw
X3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlk
KTsKPiA+Cj4gPiAgI2VuZGlmIC8qIF9BU01fTE9PTkdBUkNIX1NFVF9NRU1PUllfSCAqLwo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMgYi9hcmNoL2xvb25nYXJj
aC9tbS9wYWdlYXR0ci5jCj4gPiBpbmRleCBmZmQ4ZDc2MDIxZDQuLmYxNGI0MGM5NjhiNCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMKPiA+ICsrKyBiL2FyY2gv
bG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMKPiA+IEBAIC0yMTYsMyArMjE2LDI0IEBAIGludCBzZXRf
ZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPgo+ID4gICAg
ICAgICByZXR1cm4gX19zZXRfbWVtb3J5KGFkZHIsIDEsIF9fcGdwcm90KDApLCBfX3BncHJvdChf
UEFHRV9QUkVTRU5UIHwgX1BBR0VfVkFMSUQpKTsKPiA+ICB9Cj4gPiArCj4gPiAraW50IHNldF9k
aXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBi
b29sIHZhbGlkKQo+ID4gK3sKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2ln
bmVkIGxvbmcpcGFnZV9hZGRyZXNzKHBhZ2UpOwo+ID4gKyAgICAgICBwZ3Byb3RfdCBzZXQsIGNs
ZWFyOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gX19zZXRfbWVtb3J5KCh1bnNpZ25lZCBsb25n
KXBhZ2VfYWRkcmVzcyhwYWdlKSwgbnIsIHNldCwgY2xlYXIpOwo+IFRoaXMgbGluZSBzaG91bGQg
YmUgcmVtb3ZlZC4KCkFyZ2gsIGNvcHkvcGFzdGUgaXMgc28gaGFyZC4uLgoKVGhhbmtzLCB3aWxs
IGRvLgogCj4gSHVhY2FpCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
