Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2906ECD98CE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2026 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDaJDmEmiCvyJz7PAbHavg8v5LLtzuLAVJ3bP1cVBrY=; b=nGxhmjimMVpTm8
	jqaGzjeeLAtn8thHBR0HVnRbaKJwErPEXksHS+LoWtPoe2yE3LP/bODCKU65GXiPTu2xCrobFlm/r
	Jg0ZiJILQvI8pNkDDHWE2tewNiXwMz88Glp7CP51wp3E7mjJ5igNXERWBIa6VDK1soktfDhXav2Gu
	rNiBzeuRnAjPIoEJJNPv5qrSUKcyrYp5+gaQlZBpWZVqRrpupE9L5UJxIKwELcE7NR6CTtSLGawOz
	FYzzHbt8qIL8WdgCf22TgoXm52kKZ0+EDv4jQqdOCf8suTR7lpPRDIzlILrPvVO0Z6l4wU6Z75GDj
	ma4tlKMrwvx1L1Z3GAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDzn-0000000Eonw-2V9D;
	Mon, 15 Jun 2026 20:33:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDzm-0000000EonZ-0zGd;
	Mon, 15 Jun 2026 20:33:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77BF54360F;
	Mon, 15 Jun 2026 20:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89131F000E9;
	Mon, 15 Jun 2026 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781555601;
	bh=as7Ogfoc/AyskAy2+J9eXyhxUhgDui71XAx+CHT5Mew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E86R2Mc0QLlmn6hDEj5MnafzRYyOh8VthGPhggOCVEqZ9xx+sywlJb7QXeIaMbEFA
	 rvREbsI3Zv0iMBuDfYoDef4TgGcmk0gnzth2mBKPpYT5zfQfxZKaETEbxVznMvRfoH
	 piXE10ylpTWfk/t+pECRYcy/iMGYN/iwRMhVbs6e5bPwfcEmSrgpliHOIWdD3C35KZ
	 3dd4XZnD7RANNMAcrkEHv2ZJgOVbQ7VfGmUoC1gB6jeJzKn1pSM0YTSpCEnNMVRUEO
	 3IE0flzeBTi4viwUUEYjyjwYKI+KhiEhnh6PLe1a+NU0sfU6WVODjevHGI2ZZiYcfX
	 AyBnvEPDADOhQ==
Message-ID: <131a450f-f9c6-464c-8e4e-a4c7a29fb5de@kernel.org>
Date: Mon, 15 Jun 2026 22:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] init: discoverable root partitions, a.k.a. an
 omittable "root=" cmdline option
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
 linux-alpha@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260615-discoverable-root_partitions-v1-0-39c78fac42e2@kernel.org>
 <20260615170432.GW2636677@ZenIV>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20260615170432.GW2636677@ZenIV>
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

T24gMTUvMDYvMjAyNiBhdCAxOTowNCwgQWwgVmlybyB3cm90ZToKPiBPbiBNb24sIEp1biAxNSwg
MjAyNiBhdCAwNjowODo1NlBNICswMjAwLCBWaW5jZW50IE1haWxob2wgd3JvdGU6Cj4gCj4+IFRl
c3RlZCB3aXRoIEdSVUIsIHdoaWNoIGltcGxlbWVudHMgdGhlIExvYWRlckRldmljZVBhcnRVVUlE
IEVGSSB2YXJpYWJsZQo+PiBpbiBpdHMgYmxpIG1vZHVsZSBbM10uIFdpdGggdGhpcywgSSB3YXMg
YWJsZSB0byBib290IGEga2VybmVsIHdpdGggYQo+PiBjb21wbGV0ZWx5IGVtcHR5IGNtZGxpbmUg
YW5kIG5vIGluaXRyZC4KPj4KPj4gWzFdIFRoZSBEaXNjb3ZlcmFibGUgUGFydGl0aW9ucyBTcGVj
aWZpY2F0aW9uIChEUFMpCj4+IExpbms6IGh0dHBzOi8vdWFwaS1ncm91cC5vcmcvc3BlY2lmaWNh
dGlvbnMvc3BlY3MvZGlzY292ZXJhYmxlX3BhcnRpdGlvbnNfc3BlY2lmaWNhdGlvbi8KPj4KPj4g
WzJdIHN5c3RlbWQtZ3B0LWF1dG8tZ2VuZXJhdG9yCj4+IExpbms6IGh0dHBzOi8vd3d3LmZyZWVk
ZXNrdG9wLm9yZy9zb2Z0d2FyZS9zeXN0ZW1kL21hbi9sYXRlc3Qvc3lzdGVtZC1ncHQtYXV0by1n
ZW5lcmF0b3IuaHRtbAo+Pgo+PiBbM10gR1JVQiAtLSDCpzE2LjIgYmxpCj4+IExpbms6IGh0dHBz
Oi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZ3J1Yi9tYW51YWwvZ3J1Yi9odG1sX25vZGUvYmxpXzAw
NWZtb2R1bGUuaHRtbAo+IAo+IFNvIHdoYXQgZG9lcyB0aGF0IHRoaW5nLCB0aWVkIHRvIEVGSSBh
cyBpdCBpcywgaGF2ZSB0byBkbyB3aXRoIGFyY2hpdGVjdHVyZXMgd2hlcmUKPiAJKiBmaXJtd2Fy
ZSBpcyByYXRoZXIgdW5saWtlIEVGSQoKSSBtYWRlIENPTkZJR19EUFNfUk9PVF9BVVRPX0RJU0NP
VkVSWSBkZXBlbmQgb24gQ09ORklHX0VGSSBmb3IgdGhpcyByZWFzb24uCgo+IAkqIGZpcm13YXJl
IHdvdWxkbid0IGtub3cgd2hhdCB0byBkbyB3aXRoIEdQVAo+IAkqIEdSVUIgaXMgKm5vdCogcG9y
dGVkIHRvLCBsZXQgYWxvbmUgdXNlZAo+IHN1Y2ggYXMsIHNheSBpdCwgdGhlIHZlcnkgZmlyc3Qg
b25lIG1lbnRpb25lZCBhdCB5b3VyIFsxXT8KCkZhaXIgcG9pbnQuIEkganVzdCBkaWQ6CgogICQg
Z2l0IGdyZXAgIl5jb25maWcgRUZJJCIKICBhcmNoL2FybS9LY29uZmlnOmNvbmZpZyBFRkkKICBh
cmNoL2FybTY0L0tjb25maWc6Y29uZmlnIEVGSQogIGFyY2gvbG9vbmdhcmNoL0tjb25maWc6Y29u
ZmlnIEVGSQogIGFyY2gvcmlzY3YvS2NvbmZpZzpjb25maWcgRUZJCiAgYXJjaC94ODYvS2NvbmZp
Zzpjb25maWcgRUZJCgpBbnl0aGluZyBub3QgaW4gdGhpcyBsaXN0IGlzIGRlYWQgY29kZSBhdCB0
aGUgbW9tZW50LgoKPiBPciBpcyB0aGF0IGNvbmRpdGlvbmFsIHVwb24gImlmIGFueW9uZSB3YW50
cyB0byBkZXNpZ24gcmVwbGFjZW1lbnQgZmlybXdhcmUKPiBmb3IgdGhvc2UsIGFuZCBpZiB0aGV5
IGFncmVlIHRvIGZvbGxvdyBvdXIgd2lzaGxpc3QiPwoKTm8sIGl0IHdhcyBqdXN0IGFuIG92ZXJz
aWdodCBmcm9tIG15IHNpZGUuIEkgd2lsbCBqdXN0IGtlZXAgYXJtLCBhcm02NCwKbG9vbmdhcmNo
LCByaXNjdiBhbmQgeDg2IGluIG15IHYyLgoKCllvdXJzIHNpbmNlcmVseSwKVmluY2VudCBNYWls
aG9sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
