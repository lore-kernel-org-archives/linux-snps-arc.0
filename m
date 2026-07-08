Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1FBC43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeDSSmgTEK0mfA9tJnS7MFLV/fJgTDttuYzxeMQS5aQ=; b=DkZG65OjBzGHdE
	XhsCbFqlQHWGPsLRXlpCak+D1BH2LnPMHR8L3o4IPLBP0kqs21sdJDApG8Yu7gEWMJlkjR0Ax6D69
	XiVjyKXYc3aySXb5VG7XWhOPiTCIYRM1wJnOqchqG+VNrLuwljhcWbj0D0ADAm3x3Y0/jiE9JHhw3
	Law87ugxgyKSszgvJPZBLi86mjiURXqXN+hk7e9ENHdeZbWIToSAPNSx6NB1o9vUoIgTouLG3fNyG
	vufE7iE68anACUiDR45E9WH7kaCyre0nbTn8Pi/PuCxn98/i91dwae3v0rAaEE1d8sQdHrLv+qZoA
	Qe46ej6Z8FxFRhIBkMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZKo-00000000Oz3-13UG;
	Wed, 08 Jul 2026 20:57:34 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZKk-00000000OyS-3WdF;
	Wed, 08 Jul 2026 20:57:32 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 276CAC3437;
	Wed,  8 Jul 2026 23:57:05 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 276CAC3437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783544246;
	bh=up349XAcstBbuMmtgpGoCSrvvL3bQC70drCvWmoD2ds=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ynS36ddUdp8eq69SvUl6OgUXVC9QL2tj6JdfNjNoPXNVKwC/3CN8EubMigM7yTWhw
	 wN2l7xiScOadwqXH8k1Mr6pkHvNMtNLdr91wDtAcHVTHHdPCMoFrB5PPDCaDQEpQ/7
	 nrAG0UN1qXnV/0+w7ire/3DQ71IknBguOljyr+0fQFSjwNiLglUjXiqoASKEjWfiP9
	 hdpfN4vBD8SgIx0jZq/vsbn+u9RcOw90ghJIPsraTy3Kmn5rysmmntnF1EMEJ6MLYT
	 FeMAfAFofJ6Q5u7zyyWHuX3D2olPOI2XjVzaGihUsp+73EBHAshY/LugN1FUs+Ocpp
	 c1dTfe4hj1cHA==
Message-ID: <a8aea664b6dbe92a3ae0c2f084f5c9b1ce591792.camel@rendec.net>
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>,  Shrikanth Hegde
 <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen	 <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Sven Schnelle	 <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Mark Rutland	
 <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski	 <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson	 <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>,  Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,  Richard Weinberger	
 <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann	
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>,  Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,  "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, 	linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, 	sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Michal =?ISO-8859-1?Q?Such=E1nek?=	
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Date: Wed, 08 Jul 2026 16:57:00 -0400
In-Reply-To: <20260707190253.974626922@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190253.974626922@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_135731_052712_593272BA 
X-CRM114-Status: GOOD (  13.30  )
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
ZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBQYXVsIFdhbG1z
bGV5IDxwandAa2VybmVsLm9yZz4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0
LmNvbT4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0tLQo+IMKgYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8wqDCoMKgIDUgKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC03LDcg
KzcsNiBAQAo+IMKgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9pcnFmbGFncy5oPgo+IC0jaW5jbHVkZSA8bGlu
dXgvcmFuZG9taXplX2tzdGFjay5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gwqAj
aW5jbHVkZSA8bGludXgvc2NoZWQvZGVidWcuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9zY2hlZC9z
aWduYWwuaD4KPiBAQCAtMzMzLDkgKzMzMiw3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVj
dCBwdF9yZWdzICpyZWcKPiDCoAo+IMKgCQlyaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+
IMKgCj4gLQkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lz
Y2FsbCk7Cj4gLQo+IC0JCWFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpOwo+ICsJCXN5c2NhbGwg
PSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayhyZWdzLCBzeXNj
YWxsKTsKPiDCoAo+IMKgCQlpZiAoc3lzY2FsbCA+PSAwICYmIHN5c2NhbGwgPCBOUl9zeXNjYWxs
cykgewo+IMKgCQkJc3lzY2FsbCA9IGFycmF5X2luZGV4X25vc3BlYyhzeXNjYWxsLCBOUl9zeXNj
YWxscyk7CgpSZXZpZXdlZC1ieTogUmFkdSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
