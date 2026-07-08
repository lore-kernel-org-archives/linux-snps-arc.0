Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0071C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vq5/HmhfF+H8yL7Pa6bO3sIw9Zu1pvodsF9Jq1B16v8=; b=eGjuZct1Ildsqg
	X3s9AZnWhJCl19iBCqaO06H0UKMfvrhzE6CZsXDGkbZyrlk07l0M5Gdx4/eFQe2UzLC7dD1TkKipR
	pTPLodxNCgpyVotrOFXDWjow98twHOqvNHODKq6UZyjIYT6iMlBifpgRtdw5O6pnYvjeN/uSK6vEW
	EFyiVtKjcQZ0m0gERC7bpvKLUDt5ZSbKRqO/kBu9lxHCA5uLcpKcXSUiUn5NnbN6d5c4bzPy3Ksi0
	XUxt/zvUfcaewoUM2sbKaJv1hV6CjcGdl2Ig2zFAXJ+mvHLKlhdypwkOjISV67g2pZA85vqGDa7y8
	Q1TfpLE7nD/EG/CcCHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZLZ-00000000P93-2eVr;
	Wed, 08 Jul 2026 20:58:21 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZLW-00000000P7n-25Wc;
	Wed, 08 Jul 2026 20:58:19 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.111.125])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 16270C3449;
	Wed,  8 Jul 2026 23:57:54 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 16270C3449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783544296;
	bh=hJBHj3v5/Gy9cfslRHy86J9BqBTgDtn5Jmjc8wTF3Qk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ASe5j6xgqpQoGzd8fN2p0AV5mCM1uJJHCeUg2Rlxt6R3B/rFXg4YDm9qyballB0nF
	 MeA/AN3+LNtRqPRnWZ4RGvlOENBWHlzAAxkuy1RqiTPYNETGIv1etVCKTLohwMPCoB
	 NT/6RCbGnbqh9lOdElft3AHTFq8jVQMEygtI/j0tzDA/4gvnPpYZvymBxJHR3zU5cs
	 Ryz4Il9J/Fs/gye2m6KRNK1BfV12o1cIIRYuxI4bkUCt9PsJIjMYawd5vkU/JPUcgj
	 eyZA8hvZdnwNhc4mJqzKcQusbBCBJYXxbEKsRMMMd2jYEyC+qotSrdgXnQbdMbEvhN
	 tyu/tFqF5098Q==
Message-ID: <c765cd31891e0c222cb78697e55c4caa6dd0bded.camel@rendec.net>
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Sven Schnelle
 <svens@linux.ibm.com>, 	linux-s390@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,  Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, x86@kernel.org, Mark Rutland	
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
Date: Wed, 08 Jul 2026 16:57:51 -0400
In-Reply-To: <20260707190254.030598804@kernel.org>
References: <20260707181957.433213175@kernel.org>
	 <20260707190254.030598804@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_135818_710154_CDFA637C 
X-CRM114-Status: GOOD (  11.63  )
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
Cj4gZW50ZXJfZnJvbV91c2VyX21vZGVfcmFuZG9taXplX3N0YWNrKCkgcmVwbGFjZXMgZW50ZXJf
ZnJvbV91c2VyX21vZGUoKSBhbmQKPiB0aGUgc3Vic2VxdWVudCBpbnZvY2F0aW9uIG9mIGFkZF9y
YW5kb21fa3N0YWNrX29mZnNldF9pcnFzb2ZmKCkuCj4gCj4gQXMgYSBib251cyB0aGlzIGF2b2lk
cyB0aGUgb3ZlcmhlYWQgb2YgZ2V0L3B1dF9jcHVfdmFyKCkgaW4KPiBhZGRfcmFuZG9tX2tzdGFj
a19vZmZzZXQoKS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9yZz4KPiBDYzogU3ZlbiBTY2huZWxsZSA8
c3ZlbnNAbGludXguaWJtLmNvbT4KPiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPiAt
LS0KPiDCoGFyY2gvczM5MC9rZXJuZWwvc3lzY2FsbC5jIHzCoMKgwqAgNCArKy0tCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IC0tLSBhL2Fy
Y2gvczM5MC9rZXJuZWwvc3lzY2FsbC5jCj4gKysrIGIvYXJjaC9zMzkwL2tlcm5lbC9zeXNjYWxs
LmMKPiBAQCAtOTcsOCArOTcsOCBAQCB2b2lkIG5vaW5zdHIgX19kb19zeXNjYWxsKHN0cnVjdCBw
dF9yZWdzCj4gwqB7Cj4gwqAJdW5zaWduZWQgbG9uZyBucjsKPiDCoAo+IC0JZW50ZXJfZnJvbV91
c2VyX21vZGUocmVncyk7Cj4gLQlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsKPiArCWVudGVy
X2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayhyZWdzKTsKPiArCj4gwqAJcmVncy0+cHN3
ID0gZ2V0X2xvd2NvcmUoKS0+c3ZjX29sZF9wc3c7Cj4gwqAJcmVncy0+aW50X2NvZGUgPSBnZXRf
bG93Y29yZSgpLT5zdmNfaW50X2NvZGU7Cj4gwqAJdXBkYXRlX3RpbWVyX3N5cygpOwoKUmV2aWV3
ZWQtYnk6IFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
