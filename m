Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFADC44501
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qQWqwCAfbvi8u5LQvAzFHqnMq8q7Ke+UNdbkgmGPpk=; b=YzhtHzvSHsiPpo
	v9sA/uuG3s1eNNtesnYJv7UMOWVprAA0HKN1MymOiPzZauUy0/Ra8zwYEJiQ5eTgrA9EfHH9eCwsr
	3fpjwoTNfC09y7mJdJGI5foDsrhDr0LpFjcqbv0eVIFSf3DaCNrwvV48NETLAdWngdhcWwworCbgf
	A31IPAquxtI/sD8891ebQndKPdqCk3K9Fw8vqm8RejkZh4pftm2eSnEYTfLMPlqA7a85avpEsN3K4
	294wnEQnLJLmTu462GCJ8yhUVA/VrWw9iOXv2W+UQqevMFoDFNrrJJZj/egBNXt2ymt49F8NgoQbI
	HQ8BkmpJiq+9aAAkbokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whX8F-00000000C30-2ptu;
	Wed, 08 Jul 2026 18:36:27 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whX88-00000000BwI-3RVs;
	Wed, 08 Jul 2026 18:36:26 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id A4061C3435;
	Wed,  8 Jul 2026 21:35:54 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro A4061C3435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783535777;
	bh=HOFoesOyB88RJQpCsNVT6CnljJeq85zHo9ievtK6il8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=R0pckaM7uzKJhnfLsd+EasA5iL0B7ZA4xUo2QedrlgePDqSCeceDdoKrCaUXSgH75
	 15MPZ33HpRCU30hqcMI0PUJAA4ul+9XUwxAhJeXTpBoywEuKewGCk7m21xK7GBO94b
	 NpDa7pro6OWmXqh5IS/WT+qx6ABBrkCA+Kv5g9jMDrLVH+mh9k+/398rw04b/Uiitl
	 a9blgckrqg3HTXMb7xcAzYPWQFRHvTBk4ekkJmwrZessc3xf9tFXhmpN0qrpZBt8yq
	 5Qao1qyCtvtsSHKBGAM0cGKH+LVrTaTCbKcejqQuUrZPKj01pL+BpzMYflQ9YS3rRx
	 JbQnyYBWoKGdQ==
Message-ID: <a8c5cc7d9296d59bf3d5851a3a2ba5f3a271bb9a.camel@rendec.net>
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>,  Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>,  Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven	 <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Helge Deller	 <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, 	linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, 	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, 	linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta	 <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>,  Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>,  Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?ISO-8859-1?Q?Such=E1nek?=	
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Date: Wed, 08 Jul 2026 14:35:48 -0400
In-Reply-To: <20260707190253.918861529@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190253.918861529@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_113621_033130_E2C0E179 
X-CRM114-Status: GOOD (  12.77  )
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

T24gVHVlLCAyMDI2LTA3LTA3IGF0IDIxOjA2ICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKSByZXBsYWNl
cwo+IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSBhbmQgdGhlIHN1YnNlcXVlbnQgaW52
b2NhdGlvbiBvZgo+IGFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpLgo+IAo+IFRoZSBhZHZhbnRh
Z2UgaXMgdGhhdCBpdCBhcHBsaWVzIHRoZSBzdGFjayByYW5kb21pemF0aW9uIHJpZ2h0IGFmdGVy
Cj4gZW50ZXJfZnJvbV91c2VyX21vZGUoKSBhbmQgdGhlcmVieSBhdm9pZHMgdGhlIG92ZXJoZWFk
IG9mIGdldC9wdXRfY3B1X3ZhcigpCj4gYXMgdGhhdCBjb2RlIGlzIGludm9rZWQgd2l0aCBpbnRl
cnJ1cHRzIGRpc2FibGVkLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBNaWNoYWVsIEVs
bGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IFNocmlrYW50aCBIZWdkZSA8c3NoZWdk
ZUBsaW51eC5pYm0uY29tPgo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IC0t
LQo+IMKgYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxsLmMgfMKgwqDCoCA0ICstLS0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiAtLS0gYS9h
cmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGwuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
c3lzY2FsbC5jCj4gQEAgLTIsNyArMiw2IEBACj4gwqAKPiDCoCNpbmNsdWRlIDxsaW51eC9jb21w
YXQuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9jb250ZXh0X3RyYWNraW5nLmg+Cj4gLSNpbmNsdWRl
IDxsaW51eC9yYW5kb21pemVfa3N0YWNrLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvZW50cnktY29t
bW9uLmg+Cj4gwqAKPiDCoCNpbmNsdWRlIDxhc20vaW50ZXJydXB0Lmg+Cj4gQEAgLTE5LDggKzE4
LDcgQEAgbm90cmFjZSBsb25nIHN5c3RlbV9jYWxsX2V4Y2VwdGlvbihzdHJ1Ywo+IMKgCWxvbmcg
cmV0Owo+IMKgCXN5c2NhbGxfZm4gZjsKPiDCoAo+IC0JcjAgPSBzeXNjYWxsX2VudGVyX2Zyb21f
dXNlcl9tb2RlKHJlZ3MsIHIwKTsKPiAtCWFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpOwo+ICsJ
cjAgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayhyZWdzLCBy
MCk7Cj4gwqAKPiDCoAlpZiAodW5saWtlbHkocjAgPj0gTlJfc3lzY2FsbHMpKSB7Cj4gwqAJCWlm
ICh1bmxpa2VseSh0cmFwX2lzX3Vuc3VwcG9ydGVkX3NjdihyZWdzKSkpIHsKClJldmlld2VkLWJ5
OiBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0PgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
