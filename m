Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D62FC44501
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKYZi4gkjeUFXN+tG9Nm464f+7l2CjBtzuBdHxRweKQ=; b=XzfqtcB9ixMr3L
	cALlDqeAawxkvOyV+tUsRDBY+iKm0hhSiM2ji0gZurdD2kBaWp7ORzBjzClz/acPZLH3wkydGBjL2
	y8WXFuKPnLxiqjnr4tfhXbzBru4pnj9CxFPl99M/KeivU7Vt2ImqqNXqLIQd6nOAkO5maFwptKwMJ
	TYz8txqBLqCRh919XhgcNZrOqOwZHYPYNiGCHwGGmm8TalxwxGIrN8V2yYlyNKm1Rk1HNuSXwYja5
	xIxz5ShGlXnIk8tPy7ckX/EgxMUAHeRU5V/d4ouTl01HVhwtKtCAyldjTDeUrrzn7wsnC0HvVf8kv
	E6+Cru1shrYSKIMvw7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrae-000000032Wp-3aeD;
	Thu, 09 Jul 2026 16:27:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrab-000000032V6-403J
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 16:27:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso33945e9.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783614423; x=1784219223; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEOL8DOWD1Msvjz7k5cAG0xDAOqwGsu0BnpwMff10wU=;
        b=AeIAtOBk9ppvRbASqtFmqsdVQfMtDivwmws+YytjgA9HJz/wdmFbBoIiFKHFAqF+vS
         99pkJb1Q12cuQPTmQpCS3kftHi6w6yQptvVO94YJ1Xbchm1r3e8fV1yrJAIwi8uqgcn5
         S8+R8wRAkSFDUUCXGND0tK8bx0HP90yYDJ9DlCx8PLmYERl2HUxZNFbEGBUCgxQOzlu0
         6xFEwrwplrEITF890qj2tDh1X6EMlUj8BzkErlYcZ/WYPai5ZdhD9J/z2aeoNXGmnIOV
         etef50DkFdmN1OcnzJBotB9zUUD6Z24f/csEkT//H4GwOSe9KZVstjpP2RlGtIV7rnYE
         yXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614423; x=1784219223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEOL8DOWD1Msvjz7k5cAG0xDAOqwGsu0BnpwMff10wU=;
        b=sgZ4rp0mkOyP25XBBLh9hJG+FY9zcwh1c/gEjAxDI210ErGXdzNcB3v3OX5VtkvA06
         TDWbgsarZe3qIneHR1WReF5jQ3+pc/YE57b/963t08jxcZb/GSYXxHavS5ndvH1grjXN
         spDXqKFIDd7deAujySy1qGOIZVdCNTqwutPrgEJGfIdLDkHSDStrNKm8z9KfCeNn+n+c
         oHmp9mtSCttEcCUylLEDSFX/Hy++la09A67Kxd5zfFYv4+j0Qmbu3ZJnrbYTjPIBM1Qt
         854DVMrDnCgea9K2SYNvb2WNfKpyEbrEBxEaiERy0EV8iSzuNXIwTUNAthP+T08qPoYB
         mkaw==
X-Forwarded-Encrypted: i=1; AHgh+RoinW5/Oq5qpPAGeD4isCOEJIvZrPf1IyncDfvGt40gJIeFr7t+ewGeRbrVROLOtUL84BZMj5ZKSQqqjVmD2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi8dT/pQgWfCKku6KdTnTixnsYF9tPAABQjyYH47sx8JMdABOu
	lrRV/GMMA4fGMsYrayArNMdnbK2loex4P9D2QJ2p6OrGeOAzViM0eRI4
X-Gm-Gg: AfdE7cnz1Bxr9Nciw/9k/N/kPPrpipmajwVHCq60h4GJOPAg0D86AlYaM0vBeSy1z0u
	BQPSQaZgbZlZpAsRdpg3atoUCct5i8IIneNpQzsaoKTXJBM9N2nDJccQBfAUKd0w0m9rDMYdkvf
	v/M1uyoITUCguzeO2WStVmRJLOFD6YhvLWSAgnRgNv1k0Y1THz3sIg3noNwzf4ZFo3XzwA/r9M9
	oRn98XRPE047PzG8ZvrI8NvHmejiG+Wo52oFlubunXFGupdxTvh8cYcE6Dd9a4ZQshe6WgO4hcd
	rJR6wm2Kn/UfWdD2kYMAYcq2+uqU5/RNDKRgeLd8saaBdbiy9B9TDc2pS2jGTDUvbjK4IrkAStM
	YhfOAiIFAgnM17ipx1LD8HrlXXJ5WlJ0uWRrLK8xI8qx4SxztpShWvYPcIlGwwOEkUSJ97duiLg
	sjV2+d32EasQ4ipmWsjYlQ3ZxvJvAtZfTPjApCANWt1XxAmw==
X-Received: by 2002:a05:600d:6405:10b0:493:eec0:2b8c with SMTP id 5b1f17b1804b1-493eec02c80mr19641245e9.12.1783614423204;
        Thu, 09 Jul 2026 09:27:03 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm70023415e9.0.2026.07.09.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:27:02 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:26:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo Ren
 <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type
 bool
Message-ID: <20260709172659.7040db33@pumpkin>
In-Reply-To: <87ik6pqdkf.ffs@fw13>
References: <20260707181957.433213175@kernel.org>
	<20260707190254.338083894@kernel.org>
	<ak5ySpil83TNWxeq@kunlun.suse.cz>
	<87se5tqkyp.ffs@fw13>
	<87ik6pqdkf.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_092706_026529_CFED2A92 
X-CRM114-Status: GOOD (  30.99  )
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

T24gVGh1LCAwOSBKdWwgMjAyNiAwMToxNDoyNCArMDIwMApUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgSnVsIDA4IDIwMjYgYXQgMjI6MzQsIFRob21h
cyBHbGVpeG5lciB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDA4IDIwMjYgYXQgMTc6NTIsIE1pY2hh
bCBTdWNow6FuZWsgd3JvdGU6Cj4gPiBROiBJcyBpdCBwZXJmZWN0Pwo+ID4gQTogTm8KPiA+Cj4g
PiBROiBDYW4gaXQgYmUgbWFkZSBwZXJmZWN0Pwo+ID4gQTogTm8sIGJlY2F1c2UgeW91IGNhbid0
IGNoYW5nZSBoaXN0b3J5IGFuZCBlc3RhYmxpc2hlZCBwcmFjdGljZS4KPiA+Cj4gPiBKdXN0IGZv
ciBpbGx1c3RyYXRpb24uIENoYW5naW5nIHRoZSBsb2dpYyBpbiB0cmFjZV9zeXNjYWxsX2VudGVy
KCkgdG86Cj4gPgo+ID4gLS0tIGEva2VybmVsL2VudHJ5L3N5c2NhbGwtY29tbW9uLmMKPiA+ICsr
KyBiL2tlcm5lbC9lbnRyeS9zeXNjYWxsLWNvbW1vbi5jCj4gPiBAQCAtOSwxMyArOSwxNSBAQAo+
ID4gIAo+ID4gIGJvb2wgdHJhY2Vfc3lzY2FsbF9lbnRlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywg
bG9uZyAqc3lzY2FsbCkKPiA+ICB7Cj4gPiArCWxvbmcgb3JpZ19zeXNjYWxsID0gKnN5c2NhbGw7
Cj4gPiArCj4gPiAgCXRyYWNlX3N5c19lbnRlcihyZWdzLCAqc3lzY2FsbCk7Cj4gPiAgCS8qCj4g
PiAgCSAqIFByb2JlcyBvciBCUEYgaG9va3MgaW4gdGhlIHRyYWNlcG9pbnQgbWF5IGhhdmUgY2hh
bmdlZCB0aGUKPiA+ICAJICogc3lzdGVtIGNhbGwgbnVtYmVyLiBSZXJlYWQgaXQuCj4gPiAgCSAq
Lwo+ID4gIAkqc3lzY2FsbCA9IHN5c2NhbGxfZ2V0X25yKGN1cnJlbnQsIHJlZ3MpOwo+ID4gLQly
ZXR1cm4gKnN5c2NhbGwgIT0gLTFMOwo+ID4gKwlyZXR1cm4gKnN5c2NhbGwgPT0gb3JpZ19zeXNj
YWxsIHx8ICpzeXNjYWxsICE9IC0xTDsKPiA+ICB9Cj4gPiAgCj4gPiAgdm9pZCB0cmFjZV9zeXNj
YWxsX2V4aXQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGxvbmcgcmV0KQo+ID4KPiA+IGRvZXMgbm90
IG1ha2UgIzIgbWFnaWNhbGx5IGdvIGF3YXkuIEl0J3Mgc3RpbGwgdGhlIHNhbWUgcHJvYmxlbSB3
aGV0aGVyCj4gPiB5b3UgbGlrZSBpdCBvciBub3QuICAKPiAKPiBBbmQganVzdCB0byBiZSBlbnRp
cmVseSBjbGVhciwgdGhlIHN5c2NhbGwoKSBpbnRlcmZhY2UgaGFzIHRvIGJlIGNvcnJlY3QKPiBp
biB0aGUgZmlyc3QgcGxhY2UsIGJ1dCB0aGVuIGl0J3MgYWxsIGFib3V0IHBlcmZvcm1hbmNlLgo+
IAo+IFNvIHRoZSBzZXF1ZW5jZSBvZjoKPiAKPiAgICBwdF9yZWdzID0gUFVTSF9SRUdTKCk7Cj4g
ICAgc3lzY2FsbCA9IHB0X3JlZ3MtPnN5c2NhbGxfcmVnOwo+ICAgIHB0X3JlZ3MtPnJlc3VsdCA9
IC1FTk9TWVM7Cj4gCj4gICAgYXJjaF9zeXNjYWxsKHB0X3JlZ3MsIHN5c2NhbGwpIHsKPiAgICAg
ICBpZiAobGlrZWx5KHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocHRfcmVncywgJnN5c2Nh
bGwpIHsKCkkgZ3Vlc3MgbW9zdCBhcmNoaXRlY3R1cmVzIGlubGluZSB0aGF0IHRvIGF2b2lkIHRo
ZSAmc3lzY2FsbC4KT3RoZXJ3aXNlIHlvdSdkIHdhbnQ6CglzeXNjYWxsID0gc3lzY2FsbF9lbnRl
cl9mcm9tX3VzZXJfbW9kZShwdF9yZWdzLCBzeXNjYWxsKTsKd2l0aCB0aGUgJ2Vycm9yJyByZXR1
cm4gYmVpbmcgc2VsZWN0ZWQgdG8gZmFpbCB0aGUgdGVzdCBiZWxvdwood2hpY2ggLTFMIGNvbnZl
cnRlZCB0byB+MFVMIHdpbGwgZG8gbmljZWx5KS4KCglEYXZpZAoKPiAgICAgICAgICBpZiAoc3lz
Y2FsbCA8IFNZU0NBTExfbWF4KQo+ICAgICAgICAgICAgIHB0X3JlZ3MtPnJlc3VsdCA9IGludm9r
ZV9zeXNjYWxsKHB0X3JlZ3MsIHN5c2NhbGwpOwo+ICAgICAgIH0KPiAgICAgICAsLCwsCj4gICAg
fQo+ICAgIHB0X3JlZ3MtPigkUkVUVVJOX1ZBTFVFKSA9IHB0X3JlZ3MtPnJlc3VsdDsKPiAgICBQ
T1BfUkVHUygpOwo+ICAgIHJldHVybjsKPiAKPiBpcyB0aGUgY29ycmVjdCBhbmQgb2J2aXVvc2x5
IG1vc3QgZWZmaWNpZW50IHdheSBpZGVwZW5kZW50IG9mIHRoZSAtMUwKPiByZXR1cm4gdmFsdWUg
b3ZlcmxvYWQgaW4gdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uLCB3aGljaCB0aGlzIHNlcmll
cwo+IGdldHMgcmlkIG9mIGZvciBjbGFyaXR5Lgo+IAo+IElmIGFuIGFyY2hpdGVjdHVyZSBkZWNp
ZGVbc2RdIHRvIGRvIG90aGVyd2lzZSBhbmQgbWFrZXMgdXAgaXQncyBvd24gcnVsZXMKPiB3aGlj
aCBvbmx5IGNvdmVyIHBhcnRzIG9mIHRoZSBwcm9ibGVtIHRoZW4gaXQgX2lzXyBhbiBhcmNoaXRl
Y3R1cmUKPiBwcm9ibGVtIGFuZCBub3Qgc29tZXRoaW5nIHdoaWNoIGhhcyB0byBiZSBzb2x2ZWQg
YnkgY2xhaW1pbmcgdGhhdCBldmVyeQo+IGFyY2hpdGVjdHVyZSBoYXMgdG8gaW1wbGVtZW50IHRo
ZSBzYW1lIG5vbnNlbnNlIGFzIHlvdSBmYWxzZWx5IGNsYWltZWQKPiBpbiB5b3VyIFJGQ15XUE9D
XldoYWNrIHRocmVhZDoKPiAKPiAgICJIb3dldmVyLCB0aGUgQVBJIHNob3VsZCBiZSBzcGVjaWZp
ZWQgaW4gYSB3YXkgdGhhdCBkb2VzIG5vdCByZXF1aXJlCj4gICAgZXZlcnlvbmUgaW1wbGVtZW50
aW5nIHN1Y2ggZmxhZy4iCj4gCj4gVGhlcmUgaXMgX1pFUk9fIHJlcXVpcmVtZW50IGZvciBhbnkg
YXJjaGl0ZWN0dXJlIHRvIGltcGxlbWVudCB0aGF0Cj4gZmxhZy4gSnVzdCBiZWNhdXNlIFMzOTAg
ZGVjaWRlZCBpdCdzIGEgYnJpbGxpYW50IGlkZWEgdG8gZG8gc28gZG9lcyBub3QKPiBtYWtlIGl0
IGEgcmVxdWlyZW1lbnQgZm9yIGV2ZXJ5b25lLgo+IAo+IE5vLiBFdmVyeSBvdGhlciBhcmNoaXRl
Y3R1cmUgZ290IGl0IHJpZ2h0IGJlY2F1c2UgdGhleSBsb29rZWQgYXQgdGhlCj4gaGlzdG9yaWNh
bCBwYXR0ZXJucyBkZXNwaXRlIGhhdmluZyBjb3JyZWN0IGRvY3VtZW50YXRpb24gYXQgaGFuZC4K
PiAKPiBGZWVsIGZyZWUgdG8gcHJvdmUgbWUgd3Jvbmcgd2l0aCBhY3R1YWwgZmFjdHMuCj4gCj4g
VGhhbmtzLAo+IAo+ICAgICAgICAgdGdseAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
