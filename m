Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE4C2BA1B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Mar 2025 00:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4gBpSoxu/6vjE5j/wcgWouDCc1JGHFD8LffJqdz4Wg=; b=Ajs4D0oHyNQXrC
	8l98yQpT7Ov1x6OtMfoy+vcGqPRxfhAzE4xM0Sy8e4UWA7snjS2APp5ykARBMTunRy1uMT+tWNnxG
	rXH97N4Y/uBR5M6GDnzV0YkF1PiXTxW5rEEDfJ1WvuZOVof6hHCTEAGv/XX28q/Aum/7dqKeN4wbp
	43ma7mlBVktOx5tN2QnOx0kVKF8qdFfNPMscvgOCdtB7scuCruA404TSz40RpUnTwmEAku0DD5lBB
	xbqEflClLyVXKEgHBt1IMtcm35AHNuJPU5zgr1jwvLl4FxHOJQAFJJwrBJt1orhWogA1glmRiVG6R
	Iz+vFIfqzs0zL7lmG48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trRFi-00000001LPj-2Zxg;
	Mon, 10 Mar 2025 00:44:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trRFe-00000001LO8-2SiK;
	Mon, 10 Mar 2025 00:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DE105C4D02;
	Mon, 10 Mar 2025 00:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C42C116B1;
	Mon, 10 Mar 2025 00:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741567452;
	bh=tXY/sDLcuj92SaFYz0hFOsAFXofDkFw5jSfwl2CB2dY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ObvShaOUSxV6KHNstZFYDIQ/YvNBDM9n6zuERhfLyE5VrWSOxguuiJxiPWhJwtMnU
	 Sk3Ii6GvpW3T2XpA2iDMWHxYYEztr4yFnzbIintQL/FG7KQnnK1yLX609LGJMWnAWL
	 KJ1fdsXIOipOOusrrgeKqUvfJXnacMmdeASVUHOse3Qimf8c2sOIXXVH5L0DTyu6Jy
	 cr4CmMcAVzeASAyCZbhthYmUKg72OM4gAsvhk90glp4CmG2au8jD1wc7OXUvCGzR4+
	 jO8xHrqvnZvljrpDl1fwta+13voMQl23Oo4RKAFvOc+7yMNoSejSoDdMzf1kGvI20U
	 2G6iH4fF4pFlg==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc1f6so2681088f8f.1;
        Sun, 09 Mar 2025 17:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3+EuYUDhoYez++aErjrFpB+XhYAaLaeb7NttcWV6j44WPFnwHwc/PVodN56SHkNU/wx7Qbj6OLv0=@lists.infradead.org, AJvYcCW6DbMEJZn15J8tBsC9IMXdhdoYZjjOB7RkpNtBKr8tSvvMfl4daoyLWP/WTs66QKvWo2B25jjseTZvhe1VGSE=@lists.infradead.org, AJvYcCWMuwqgVP3q6zxjnQhTL7iY1uq7BVd9R+ElHG4rTsejyiqWL4CxXxqZy6tDnyIPGWSkgdcIwFKEkG9sK1IDC8ZK@lists.infradead.org, AJvYcCWsLwOk/FN0EVgVjd3VnzUupjg3de0XfnAhjzCaGsr+fv8SaEbIlb8kiJTopWOfW6CnUVmvbzcHDhlLRN0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxetNZtILOW5ViGcLNJVMaXoQZ8Q9/v9QZ/oOMcCUGruush+S+W
	3RtVWlgLOZDdq20zrRvAQrK0S5+CxL5p8a2haSf13/DNWUwffOMiqPd1xoaxgEha/exISnB1nAX
	zAf7E2ltnyLe4PNJfL5hYPZadGjk=
X-Google-Smtp-Source: AGHT+IHp0xTG1Ng23HFO+vDoVdsoufkarKG1pMLa2Hgf32UrExuCoU7QvtsFi3JnHOAx4U/X+f6ME+7JOCYs321ZM0M=
X-Received: by 2002:a5d:6d8a:0:b0:391:1218:d5f7 with SMTP id
 ffacd0b85a97d-39132dacbd3mr7997015f8f.40.1741567450112; Sun, 09 Mar 2025
 17:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-3-rppt@kernel.org>
In-Reply-To: <20250306185124.3147510-3-rppt@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 10 Mar 2025 08:43:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQBLMt01QjnhX1tCgHs6HJm1hZXQXgVjNkNS5Yt5t4UCQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpCBLojM2w9P1ED3pCe1VmP9TPz-dzItajSIbNDMlmKYLEeMGoNaHpCAZk
Message-ID: <CAJF2gTQBLMt01QjnhX1tCgHs6HJm1hZXQXgVjNkNS5Yt5t4UCQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] csky: move setup_initrd() to setup.c
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_174414_720113_734CD416 
X-CRM114-Status: GOOD (  22.53  )
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

TW92ZSBzZXR1cF9pbml0cmQgZnJvbSBtZW1faW5pdCBpbnRvIG1lbWJsb2NrX2luaXQsIHRoYXQg
TEdUTS4KCkFja2VkIGJ5OiBHdW8gUmVuIChjc2t5KSA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpPbiBG
cmksIE1hciA3LCAyMDI1IGF0IDI6NTLigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkiIDxycHB0QGtl
cm5lbC5vcmc+Cj4KPiBNZW1vcnkgdXNlZCBieSBpbml0cmQgc2hvdWxkIGJlIHJlc2VydmVkIGFz
IHNvb24gYXMgcG9zc2libGUgYmVmb3JlCj4gdGhlcmUgYW55IG1lbWJsb2NrIGFsbG9jYXRpb25z
IHRoYXQgbWlnaHQgb3ZlcndyaXRlIHRoYXQgbWVtb3J5Lgo+Cj4gVGhpcyB3aWxsIGFsc28gaGVs
cCB3aXRoIHB1bGxpbmcgb3V0IG1lbWJsb2NrX2ZyZWVfYWxsKCkgdG8gdGhlIGdlbmVyaWMKPiBj
b2RlIGFuZCByZWR1Y2luZyBjb2RlIGR1cGxpY2F0aW9uIGluIGFyY2g6Om1lbV9pbml0KCkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIGFyY2gvY3NreS9rZXJuZWwvc2V0dXAuYyB8IDQzICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9jc2t5L21tL2luaXQuYyAgICAgIHwg
NDMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYwo+IGlu
ZGV4IGZlNzE1YjcwN2ZkMC4uZTBkNmNhODZlYThjIDEwMDY0NAo+IC0tLSBhL2FyY2gvY3NreS9r
ZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYwo+IEBAIC0xMiw2
ICsxMiw0NSBAQAo+ICAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+Cj4gICNpbmNsdWRlIDxh
c20vcGdhbGxvYy5oPgo+Cj4gKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklUUkQKPiArc3RhdGlj
IHZvaWQgX19pbml0IHNldHVwX2luaXRyZCh2b2lkKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIHNpemU7Cj4gKwo+ICsgICAgICAgaWYgKGluaXRyZF9zdGFydCA+PSBpbml0cmRfZW5kKSB7
Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiaW5pdHJkIG5vdCBmb3VuZCBvciBlbXB0eSIpOwo+
ICsgICAgICAgICAgICAgICBnb3RvIGRpc2FibGU7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
aWYgKF9fcGEoaW5pdHJkX2VuZCkgPiBQRk5fUEhZUyhtYXhfbG93X3BmbikpIHsKPiArICAgICAg
ICAgICAgICAgcHJfZXJyKCJpbml0cmQgZXh0ZW5kcyBiZXlvbmQgZW5kIG9mIG1lbW9yeSIpOwo+
ICsgICAgICAgICAgICAgICBnb3RvIGRpc2FibGU7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
c2l6ZSA9IGluaXRyZF9lbmQgLSBpbml0cmRfc3RhcnQ7Cj4gKwo+ICsgICAgICAgaWYgKG1lbWJs
b2NrX2lzX3JlZ2lvbl9yZXNlcnZlZChfX3BhKGluaXRyZF9zdGFydCksIHNpemUpKSB7Cj4gKyAg
ICAgICAgICAgICAgIHByX2VycigiSU5JVFJEOiAweCUwOGx4KzB4JTA4bHggb3ZlcmxhcHMgaW4t
dXNlIG1lbW9yeSByZWdpb24iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgX19wYShpbml0cmRf
c3RhcnQpLCBzaXplKTsKPiArICAgICAgICAgICAgICAgZ290byBkaXNhYmxlOwo+ICsgICAgICAg
fQo+ICsKPiArICAgICAgIG1lbWJsb2NrX3Jlc2VydmUoX19wYShpbml0cmRfc3RhcnQpLCBzaXpl
KTsKPiArCj4gKyAgICAgICBwcl9pbmZvKCJJbml0aWFsIHJhbWRpc2sgYXQ6IDB4JXAgKCVsdSBi
eXRlcylcbiIsCj4gKyAgICAgICAgICAgICAgICh2b2lkICopKGluaXRyZF9zdGFydCksIHNpemUp
Owo+ICsKPiArICAgICAgIGluaXRyZF9iZWxvd19zdGFydF9vayA9IDE7Cj4gKwo+ICsgICAgICAg
cmV0dXJuOwo+ICsKPiArZGlzYWJsZToKPiArICAgICAgIGluaXRyZF9zdGFydCA9IGluaXRyZF9l
bmQgPSAwOwo+ICsKPiArICAgICAgIHByX2VycigiIC0gZGlzYWJsaW5nIGluaXRyZFxuIik7Cj4g
K30KPiArI2VuZGlmCj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgY3NreV9tZW1ibG9ja19pbml0
KHZvaWQpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG93bWVtX3NpemUgPSBQRk5fRE9X
TihMT1dNRU1fTElNSVQgLSBQSFlTX09GRlNFVF9PRkZTRVQpOwo+IEBAIC00MCw2ICs3OSwxMCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgY3NreV9tZW1ibG9ja19pbml0KHZvaWQpCj4gICAgICAgICAg
ICAgICAgIG1heF9sb3dfcGZuID0gbWluX2xvd19wZm4gKyBzc2VnX3NpemU7Cj4gICAgICAgICB9
Cj4KPiArI2lmZGVmIENPTkZJR19CTEtfREVWX0lOSVRSRAo+ICsgICAgICAgc2V0dXBfaW5pdHJk
KCk7Cj4gKyNlbmRpZgo+ICsKPiAgICAgICAgIG1heF96b25lX3BmbltaT05FX05PUk1BTF0gPSBt
YXhfbG93X3BmbjsKPgo+ICAgICAgICAgbW11X2luaXQobWluX2xvd19wZm4sIG1heF9sb3dfcGZu
KTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L21tL2luaXQuYyBiL2FyY2gvY3NreS9tbS9pbml0
LmMKPiBpbmRleCBiZGU3Y2FiZDIzZGYuLmFiNTFhY2JjMTliMiAxMDA2NDQKPiAtLS0gYS9hcmNo
L2Nza3kvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9jc2t5L21tL2luaXQuYwo+IEBAIC00Miw0NSAr
NDIsNiBAQCB1bnNpZ25lZCBsb25nIGVtcHR5X3plcm9fcGFnZVtQQUdFX1NJWkUgLyBzaXplb2Yo
dW5zaWduZWQgbG9uZyldCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgX19wYWdlX2FsaWduZWRfYnNzOwo+ICBFWFBPUlRfU1lNQk9MKGVtcHR5X3plcm9f
cGFnZSk7Cj4KPiAtI2lmZGVmIENPTkZJR19CTEtfREVWX0lOSVRSRAo+IC1zdGF0aWMgdm9pZCBf
X2luaXQgc2V0dXBfaW5pdHJkKHZvaWQpCj4gLXsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6
ZTsKPiAtCj4gLSAgICAgICBpZiAoaW5pdHJkX3N0YXJ0ID49IGluaXRyZF9lbmQpIHsKPiAtICAg
ICAgICAgICAgICAgcHJfZXJyKCJpbml0cmQgbm90IGZvdW5kIG9yIGVtcHR5Iik7Cj4gLSAgICAg
ICAgICAgICAgIGdvdG8gZGlzYWJsZTsKPiAtICAgICAgIH0KPiAtCj4gLSAgICAgICBpZiAoX19w
YShpbml0cmRfZW5kKSA+IFBGTl9QSFlTKG1heF9sb3dfcGZuKSkgewo+IC0gICAgICAgICAgICAg
ICBwcl9lcnIoImluaXRyZCBleHRlbmRzIGJleW9uZCBlbmQgb2YgbWVtb3J5Iik7Cj4gLSAgICAg
ICAgICAgICAgIGdvdG8gZGlzYWJsZTsKPiAtICAgICAgIH0KPiAtCj4gLSAgICAgICBzaXplID0g
aW5pdHJkX2VuZCAtIGluaXRyZF9zdGFydDsKPiAtCj4gLSAgICAgICBpZiAobWVtYmxvY2tfaXNf
cmVnaW9uX3Jlc2VydmVkKF9fcGEoaW5pdHJkX3N0YXJ0KSwgc2l6ZSkpIHsKPiAtICAgICAgICAg
ICAgICAgcHJfZXJyKCJJTklUUkQ6IDB4JTA4bHgrMHglMDhseCBvdmVybGFwcyBpbi11c2UgbWVt
b3J5IHJlZ2lvbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgICBfX3BhKGluaXRyZF9zdGFydCks
IHNpemUpOwo+IC0gICAgICAgICAgICAgICBnb3RvIGRpc2FibGU7Cj4gLSAgICAgICB9Cj4gLQo+
IC0gICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShfX3BhKGluaXRyZF9zdGFydCksIHNpemUpOwo+IC0K
PiAtICAgICAgIHByX2luZm8oIkluaXRpYWwgcmFtZGlzayBhdDogMHglcCAoJWx1IGJ5dGVzKVxu
IiwKPiAtICAgICAgICAgICAgICAgKHZvaWQgKikoaW5pdHJkX3N0YXJ0KSwgc2l6ZSk7Cj4gLQo+
IC0gICAgICAgaW5pdHJkX2JlbG93X3N0YXJ0X29rID0gMTsKPiAtCj4gLSAgICAgICByZXR1cm47
Cj4gLQo+IC1kaXNhYmxlOgo+IC0gICAgICAgaW5pdHJkX3N0YXJ0ID0gaW5pdHJkX2VuZCA9IDA7
Cj4gLQo+IC0gICAgICAgcHJfZXJyKCIgLSBkaXNhYmxpbmcgaW5pdHJkXG4iKTsKPiAtfQo+IC0j
ZW5kaWYKPiAtCj4gIHZvaWQgX19pbml0IG1lbV9pbml0KHZvaWQpCj4gIHsKPiAgI2lmZGVmIENP
TkZJR19ISUdITUVNCj4gQEAgLTkyLDEwICs1Myw2IEBAIHZvaWQgX19pbml0IG1lbV9pbml0KHZv
aWQpCj4gICNlbmRpZgo+ICAgICAgICAgaGlnaF9tZW1vcnkgPSAodm9pZCAqKSBfX3ZhKG1heF9s
b3dfcGZuIDw8IFBBR0VfU0hJRlQpOwo+Cj4gLSNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklUUkQK
PiAtICAgICAgIHNldHVwX2luaXRyZCgpOwo+IC0jZW5kaWYKPiAtCj4gICAgICAgICBtZW1ibG9j
a19mcmVlX2FsbCgpOwo+Cj4gICNpZmRlZiBDT05GSUdfSElHSE1FTQo+IC0tCj4gMi40Ny4yCj4K
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25w
cy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
