Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7595606A31B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Oct 2026 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BdBirZ9w;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVuBmyz9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ldh8B8gXV8dAX8eFPmA3Xu4LmDSL3A/w5loqkQcCOqs=; b=BdBirZ9wAtDR+eInzgfEt/xeOC
	KANYPMeUrrIJFfFX8czdurtSm6vjnnUppW8eFBtzKmFNSrKbOxwu0ZmoyQ9UB48/jYoLwCQp4dbUB
	I+qf4VzDYjVtGFvSVmDLXlG5u1Pq7whPOeJWoTk8C0pkO+IlgNJdiaZpXVfhZWiKd4ttywrWiPsqh
	zX2yI/nKde5RsUiEVUMnLW5sa3oVDzi1tW86JBEu0GEkjAAsiMf+AdVQ4eSk6kxiCw7YQl11VLM32
	QJryidpi7k1TdYSBRGNevEYdg9j2lCtsjQA5NjFVwx8OphInpqSWoBQTKqS/379px4sRZw5uSnrub
	/M18Er7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0QR-0000000F0iT-0gym;
	Thu, 22 Oct 2026 21:34:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0QP-0000000F0i9-10ko;
	Thu, 22 Oct 2026 21:34:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64430417B6;
	Thu, 22 Oct 2026 21:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470391F01825;
	Thu, 22 Oct 2026 21:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792704852;
	bh=cn/ldllbPOccKT21c7wYmV4T2wO/b1MXRFJD8m7a2a8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XVuBmyz9FPf6yo7k98oYXwvQ2CrUnSJeao5n2AE3SOVv2l8FnxqKfufmW9zVdl1ZU
	 7/jjD7DxhQpzVSSzHcskY8OGVIszVl5rWYnpntfdjYicc8x0Z6/FYO+Wzbi2T5kazo
	 L8wyFIJNbwU+07rXhxkK8jIdHdZ6tDaDdk9OEGeX5P0F2vbBvHawTeck8SVK7xJ13l
	 bLCTcobXnjYr+eT5lvnBYy6PAblfW6x3KhaSIJ+hc3UMxyUpT6D2mZRMwE0YVSvFIV
	 kiuB3v9mM2Wpy9nJrXroSIigc+RYm5nfye7Fnp+zdBjGDGKIQfa7LtzprWk3IcxwgI
	 p4Zzqpbf/Yjeg==
From: Thomas Gleixner <tglx@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
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
 linux-arch@vger.kernel.org, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
In-Reply-To: <87fqxx1r80.ffs@fw13>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org>
 <20261022142425.3Wx-RrU5@linutronix.de> <87fqxx1r80.ffs@fw13>
Date: Thu, 22 Oct 2026 23:34:08 +0200
Message-ID: <87cxt11ktr.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIgMjAyNiBhdCAyMToxNSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9u
IFRodSwgT2N0IDIyIDIwMjYgYXQgMTY6MjQsIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3Igd3Jv
dGU6Cj4+IE9uIDIwMjYtMDctMDcgMjE6MDc6MDEgWyswMjAwXSwgVGhvbWFzIEdsZWl4bmVyIHdy
b3RlOgo+PiB8W1JVTl0gICAgICAgICAgIENoZWNraW5nIG91dCBvZiByYW5nZSBzeXN0ZW0gY2Fs
bHMKPj4gfFtGQUlMXSAgICAgICAgICAgICAgICAgIHgzMiBzeXNjYWxsIDE6LTY0IHJldHVybmVk
IC05OTk5LCBidXQgaXQgc2hvdWxkIGhhdmUgcmV0dXJuZWQgLUVOT1NZUwo+PiB8W0ZBSUxdICAg
ICAgICAgICAgICB4MzIgc3lzY2FsbHMgMTotNjQuLi0yIGhhZCA2MyBmYWlsdXJlCj4+IHxbT0td
ICAgICAgICAgICAgICAgIHgzMiBzeXNjYWxsIDE6LTEgcmV0dXJuZWQgTU9ESUZJRURfQllfUFRS
QUNFIGFzIGV4cGVjdGVkCj4+IHxbRkFJTF0gICAgICAgICAgICAgICAgICB4NjQgc3lzY2FsbCAx
OjEwNzM3NDE3NjAgcmV0dXJuZWQgLTk5OTksIGJ1dCBpdCBzaG91bGQgaGF2ZSByZXR1cm5lZCAt
RU5PU1lTCj4+IOKApgo+Pgo+PiBhbmQgc28gb27igKYgVGhlIHRlc3QgaGFzCj4+Cj4+IHwgI2Rl
ZmluZSBNT0RJRklFRF9CWV9QVFJBQ0UgICAgICAtOTk5OQo+Pgo+PiBhbmQgdGhlIHB0cmFjZXIg
bW9kaWZpZXMgdGhlIHJldHVybiBjb2RlLiBIb3dldmVyIG5vdCBhbHdheXMuIE5vdCBzdXJlCj4+
IGlmIHRoaXMgd2FzIGluZGVlZCBhIHBvaW50bGVzcyBleGVyY2lzZSBvciBub3QuCj4KPiBIcm1t
LiBUaGF0J3Mgd2VpcmQuIExldCBtZSBoYXZlIGEgbG9vay4KClNvIEkgY2xlYXJseSBmYWlsZWQg
dG8gZGVjb2RlIHRoZSBvdmVybG9hZGluZyBvZiB0aGUgLTFMIHJldHVybiB2YWx1ZQpjb3JyZWN0
bHkgYW5kIHRoZW4gZmFpbGVkIHRvIHJ1biB0aGUgc3R1cGlkIHRlc3QuCgpUQkgsIHRoaXMgd2hv
bGUgdGhpbmcgd2FzIGEgaG9ycmlkIGFuZCBpbmNvbnNpc3RlbnQgbWVzcy4KClRoZSBsb2dpYyBp
biB0aGUgb3JpZ2luYWwgY29kZSB3YXM6CgogICAgV2hlbiB0aGUgZW50cnkgd29yayBjb2RlIHJl
dHVybmVkIGFuIGludmFsaWQgc3lzY2FsbCBudW1iZXIgdGhlbiB0aGUKICAgIHJldHVybiB2YWx1
ZSBpbiByZWdzLT5heCB3YXMgc2V0IHRvIC1FTk9TWVMsIGV4Y2VwdCB3aGVuIHRoZQogICAgcmV0
dXJuZWQgc3lzY2FsbCBudW1iZXIgd2FzIC0xLiBTeXNjYWxsIG51bWJlciAiLTEiIGluZGljYXRl
ZCB0aGF0CiAgICB0aGUgc3lzY2FsbCBoYXMgdG8gYmUgYWJvcnRlZC4KCiAgICAgcmVncy0+YXgg
PSAtRU5PU1lTOwogICAgIHN5c2NhbGwgPSBlbnRlcl93b3JrKHJlZ3MsIHN5c2NhbGwpOwogICAg
IGlmIChzeXNjYWxsX2luX3JhbmdlKHN5c2NhbGwpKQogICAgICAgIHJlZ3MtPmF4ID0gZG9fc3lz
Y2FsbChzeXNjYWxsKTsKICAgICBlbHNlIGlmIChzeXNjYWxsICE9IC0xKQogICAgICAgIHJlZ3Mt
PmF4ID0gLUVOT1NZUzsKClNvIGlmIHRoZSBwdHJhY2UgY2hlY2sgaW4gZW50ZXJfd29yaygpIG92
ZXJ3cm90ZSByZWdzLT5heCBhbmQgdGhlCnN5c2NhbGwgbnVtYmVyIChlaXRoZXIgYXMgc3VwcGxp
ZWQgYnkgdXNlciBzcGFjZSBvciByZXdyaXR0ZW4pIHdhcyBvdXQKb2YgcmFuZ2UgYW5kIG5vdCAt
MSB0aGVuIHRoZSB4ODYgZW50cnkgY29kZSBvdmVyd3JvdGUgcmVncy0+YXggdG8KLUVOT1NZUyBh
Z2Fpbi4gSU9XLCB0aGVyZSBpcyBubyBkaXN0aW5jdGlvbiBiZXR3ZWVuIGEgY2hlY2sgaW5kdWNl
ZAphYm9ydCBhbmQgYSBzeXNjYWxsIHdpdGggc3lzY2FsbCBudW1iZXIgLTEuCgpUaGUgcmV3b3Jr
IGNoYW5nZWQgdGhlIHJldHVybiB2YWx1ZSB0byBib29sZWFuLCB3aGljaCBpcyB0cnVlIHdoZW4g
dGhlCnN5c2NhbGwgc2hvdWxkIGJlIGludm9rZWQgYW5kIGZhbHNlIHdoZW4gb25lIG9mIHRoZSBj
aGVja3MgcmVxdWVzdHMgdG8KYWJvcnQgdGhlIHN5c2NhbGwuIEluIHRoYXQgY2FzZSB0aGUgcmV0
dXJuIGNvZGUgZG9lcyBub3QgdG91Y2ggdGhlCnJldHVybiB2YWx1ZSBpbiByZWdzLT5heC4KCklm
IHRoZSBldmVudHVhbGx5IG1vZGlmaWVkIHN5c2NhbGwgbnVtYmVyIGlzIG91dCBvZiByYW5nZSB0
aGVuIHRoZSBjb2RlCnJlbGllcyBvbiB0aGUgZmFjdCB0aGF0IHJlZ3MtPmF4IHdhcyBwcmVzZXQg
d2l0aCAtRU5PU1lTLCBpLmUuOgoKICAgICByZWdzLT5heCA9IC1FTk9TWVM7CiAgICAgLy8gVHJ1
ZSBpbmRpY2F0ZXMgdG8gcHJvY2VlZAogICAgIGlmIChlbnRlcl93b3JrKHJlZ3MsICZzeXNjYWxs
KSkgewogICAgICAgICBpZiAoc3lzY2FsbF9pbl9yYW5nZShzeXNjYWxsKSkKICAgICAgICAgICAg
cmVncy0+YXggPSBkb19zeXNjYWxsKHN5c2NhbGwpOwogICAgIH0KClRoYXQgc2VlbXMgdG8gYmUg
ZXF1aXZhbGVudCwgYnV0IGl0IGlzIG5vdCB3aGVuIHB0cmFjZSgpIG1vZGlmaWVzCnRoZSByZXR1
cm4gdmFsdWUgaW4gcmVncy0+YXggYW5kIGFsc28gcmV3cml0ZXMgdGhlIHN5c2NhbGwgbnVtYmVy
IHRvIGFuCmludmFsaWQgdmFsdWUgb3IgbGVhdmVzIHRoZSB1c2VyIHN1cHBsaWVkIGludmFsaWQg
dmFsdWUgaW50YWN0IGFuZCBkb2VzCl9OT1RfIGFib3J0IHRoZSBzeXNjYWxsLgoKU28gdGhlIHJl
d29ya2VkIGNvZGUgZG9lcyBub3Qgb3ZlcndyaXRlIHRoZSB0cmFjZXIgbW9kaWZpZWQgcmV0dXJu
IHZhbHVlCndpdGggLUVOT1NZUyBpbiB0aGF0IGNhc2UgYW5kIHJldHVybnMgd2hhdGV2ZXIgdGhl
IHRyYWNlciBkZWNpZGVkIHRvIHB1dAppbnRvIGl0LgoKVEJILCB0aGF0IG1ha2VzIGEgbG90IG1v
cmUgc2Vuc2UgdGhhbiB0aGUgb3JpZ2luYWwgYmVoYXZpb3IuIElmIHRoZQp0cmFjZXIgZGVjaWRl
cyB0byBmaWRkbGUgd2l0aCB0aGUgZGVmYXVsdCByZXR1cm4gdmFsdWUgdGhlbiB0aGF0J3Mgd2hh
dAp0aGUgdHJhY2VyIGludGVuZGVkLgoKVGhhdCBtYWtlcyB0aGUgYmVoYXZpb3IgY29uc2lzdGVu
dCB2cy4gb3RoZXIgYWJvcnQgc2NlbmFyaW9zOgoKICAgIHB0cmFjZSgpCiAgICAgIHJlZ3MtPmF4
ID0gTUFHSUM7CiAgICAgIHJldHVybiB0cnVlOyAgICAgICAgICAgIC8vIEFsbG93IHN5c2NhbGwK
CiAgICBzZWNjb21wKCkKICAgICAgcmV0dXJuIGZhbHNlOyAgICAgICAgICAvLyBBYm9ydCBzeXNj
YWxsCgpTbyB3aGVuIHRoZSB0cmFjZXIgbW9kaWZpZWQgdGhlIHJldHVybiB2YWx1ZSBhbmQgc2Vj
Y29tcCBhYm9ydHMgdGhlCnN5c2NhbGwgdGhlbiB0aGUgdHJhY2VyIGluZHVjZWQgdmFsdWUgaXMg
cHJlc2VydmVkLiBUaGF0IHdhcyB0aGUgY2FzZSBpbgp0aGUgb3JpZ2luYWwgY29kZSBhcyB3ZWxs
IGJlY2F1c2Ugc2VjY29tcCgpIGluZGljYXRlZCB0aGUgYWJvcnQgYnkKcmV0dXJuaW5nIC0xIGFz
IHRoZSBtb2RpZmllZCBzeXNjYWxsIG51bWJlci4gU2ltaWxhciBlZmZlY3RzIHdoZW4gZnRyYWNl
CihCUEYsIGtwcm9iZSkgZGVjaWRlZCB0byBvdmVyd3JpdGUgdGhlIHN5c2NhbGwgbnVtYmVyKS4K
CkJyaW5naW5nIHRoZSBvcmlnaW5hbCBiZWhhdmlvdXIgYmFjayBpcyB0cml2aWFsIGVub3VnaCwg
YnV0IEknbSBub3QKY29udmluY2VkIHRoYXQgaXQgbWFrZXMgYW55IHNlbnNlIGFuZCBpcyB3b3J0
aCBpdC4gQXQgbGVhc3QgdGhpcwpjb25maW5lcyB0aGUgeDMyIHNwZWNpZmljIGluc2FuaXR5IG9m
IHRyZWF0aW5nIC0xIHNwZWNpYWwgdG8geDMyLi4uCgpUaGFua3MsCgogICAgICAgIHRnbHgKLS0t
Ci0tLSBhL2FyY2gveDg2L2VudHJ5L3N5c2NhbGxfMzIuYworKysgYi9hcmNoL3g4Ni9lbnRyeS9z
eXNjYWxsXzMyLmMKQEAgLTc3LDYgKzc3LDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lk
IGRvX3N5c2NhbGxfMwogCWlmIChsaWtlbHkobnIgPCBJQTMyX05SX3N5c2NhbGxzKSkgewogCQlu
ciA9IGFycmF5X2luZGV4X25vc3BlYyhuciwgSUEzMl9OUl9zeXNjYWxscyk7CiAJCXJlZ3MtPmF4
ID0gaWEzMl9zeXNfY2FsbChyZWdzLCAodW5zaWduZWQgaW50KW5yKTsKKwl9IGVsc2UgeworCQly
ZWdzLT5heCA9IC1FTk9TWVM7CiAJfQogfQogCi0tLSBhL2FyY2gveDg2L2VudHJ5L3N5c2NhbGxf
NjQuYworKysgYi9hcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmMKQEAgLTY0LDE1ICs2NCwyNCBA
QCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgZG9fc3lzY2FsbF94CiAJcmV0dXJuIGZhbHNl
OwogfQogCi1zdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgZG9fc3lzY2FsbF94MzIoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgbnIpCitzdGF0aWMgX19hbHdheXNfaW5saW5l
IGJvb2wgZG9fc3lzY2FsbF94MzIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcg
bnIpCiB7CisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19YODZfWDMyX0FCSSkpCisJCXJldHVybiBm
YWxzZTsKKworCS8qIFByZXNlcnZlIHRoZSBoaXN0b3JpYyBpbnNhbml0eSBvZiB0cmVhdGluZyAt
MSBzcGVjaWFsIG9uIHgzMiAqLworCWlmIChuciA9PSBVTE9OR19NQVgpCisJCXJldHVybiB0cnVl
OworCiAJLyogQWRqdXN0IHRoZSBzdGFydGluZyBvZmZzZXQgb2YgdGhlIHRhYmxlICovCiAJbnIg
LT0gX19YMzJfU1lTQ0FMTF9CSVQ7CiAKLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfWDg2X1gzMl9B
QkkpICYmIGxpa2VseShuciA8IFgzMl9OUl9zeXNjYWxscykpIHsKKwlpZiAobGlrZWx5KG5yIDwg
WDMyX05SX3N5c2NhbGxzKSkgewogCQluciA9IGFycmF5X2luZGV4X25vc3BlYyhuciwgWDMyX05S
X3N5c2NhbGxzKTsKIAkJcmVncy0+YXggPSB4MzJfc3lzX2NhbGwocmVncywgKHVuc2lnbmVkIGlu
dClucik7CisJCXJldHVybiB0cnVlOwogCX0KKwlyZXR1cm4gZmFsc2U7CiB9CiAKIC8qIFJldHVy
bnMgdHJ1ZSB0byByZXR1cm4gdXNpbmcgU1lTUkVULCBvciBmYWxzZSB0byB1c2UgSVJFVCAqLwpA
QCAtODEsOCArOTAsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGRvX3N5c2NhbGxf
eAogCWlmIChsaWtlbHkoc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3Rh
Y2socmVncywgJm5yKSkpIHsKIAkJaW5zdHJ1bWVudGF0aW9uX2JlZ2luKCk7CiAKLQkJaWYgKCFk
b19zeXNjYWxsX3g2NChyZWdzLCBucikpCi0JCQlkb19zeXNjYWxsX3gzMihyZWdzLCBucik7CisJ
CWlmICh1bmxpa2VseSghZG9fc3lzY2FsbF94NjQocmVncywgbnIpKSkgeworCQkJaWYgKCFkb19z
eXNjYWxsX3gzMihyZWdzLCBucikpCisJCQkJcmVncy0+YXggPSAtRU5PU1lTOworCQl9CiAKIAkJ
aW5zdHJ1bWVudGF0aW9uX2VuZCgpOwogCX0KCgoKCgoKCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
