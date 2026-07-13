Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DE2C43458
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jul 2026 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6tt1pO0ezBetqZFBkJVcGyHzCEak4FvlBnEM+y6oaU=; b=LxThj8XW12rv5C
	uUQwmr5LIK8kESq1TsgH6ys2TfurbY40AdM29OalLZYnanUHiuRrtstLA466cZki4u0nXzR4NYUTM
	Y4N4m9dbJlOVroXJBAYKsrBScg/3m6Yi1eXcvTGMUbyMW0uiJrC0Y+cW+NRR3kvQHmNSWzLKOlbgs
	mxHOVKx2f0ZfihiDltS6AxkHLJgPXJ0WBPBtnhuX7QykdQsgaVey0/LMkZXiEzOAEi6n2leu5vCHu
	gNhN+4lh73Dv4p89f7mGkDSYKr2rPJi0Ue6RJ+jqt12GYIqq/yhIxkR5pQHwSoHV2dCnZNDiCSsN9
	b9ySUF1XOnw2ouxInTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAkE-00000008KiU-3xvA;
	Mon, 13 Jul 2026 07:06:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAkD-00000008KhX-00ts
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 Jul 2026 07:06:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D4C643B16
	for <linux-snps-arc@lists.infradead.org>; Mon, 13 Jul 2026 07:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C021F0155E
	for <linux-snps-arc@lists.infradead.org>; Mon, 13 Jul 2026 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783926384;
	bh=MaoMLNzrQSdilHBAPxvn7cFGYo6KCQRZiQrYmmdeSDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TbglOxZrZc+8ho1Z2BcK0IhS3egNUSq0c5Yekd6nxDBKZQhVPPnrHghm6ItjXrvW8
	 myYXJ6x6lFh7QX5ecmuh/vq7Qwc4aN3eTk8kvvmFs1d8wRQY7vrvAGfQK8ML7sZ4Yj
	 k2WeLrzUteazWoeRwgjCCUDZJ2+PWRLzL1ozd2prV95l5uW3ki91C/T/KpUndY2saf
	 +I1D4H0CLwMJu74DptZISJOOYDmUct5uhnCyLsAUx2HSrcK3fC5VZsBannIxQYZ7Rq
	 GNjV6d1+IgN8jsegZ7lli5dbQ5dULez5iyH6dt+oUZzipNLSJVSN9n9AB3HDQyztKw
	 NLk2nciGwWqEA==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so16847295e9.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 13 Jul 2026 00:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrJZRA4mJU2SmZBviFgwl4wSfDXUnK+YgV7211Rn8DbETc/k3Tyq+0xP63s5jBeSIiEFlbRJKeqtYubWw2/0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFZ66FnDGDirnl6IUL86/Rm4kzXuYDvd9oClMbl1PRUld/NABC
	hyPpkyMdXKovmrgQnMX1fN6bJy/OpVGdzLxjlo99X2KEhab++GrKxS1ULmAOyngQB3+PPf9D1mn
	ABnewvVpk2/1Trd40vGFIBU4MMLmB+9g=
X-Received: by 2002:a05:6000:186c:b0:476:d13f:bb74 with SMTP id
 ffacd0b85a97d-47f2dc9bac8mr8770361f8f.15.1783926382749; Mon, 13 Jul 2026
 00:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190253.974626922@kernel.org>
In-Reply-To: <20260707190253.974626922@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Jul 2026 15:06:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjW0RfZsJmHVAqrRsHpK4cJ+01G_Kkytt=0Wpm4sZpkg@mail.gmail.com>
X-Gm-Features: AUfX_mzuKA4JwmuMUWB774bzpkP7q4a7PrJvxtp8N1GWwrENQwGP0BULxiqlyqc
Message-ID: <CAJF2gTTjW0RfZsJmHVAqrRsHpK4cJ+01G_Kkytt=0Wpm4sZpkg@mail.gmail.com>
Subject: Re: [patch 06/18] riscv/syscall: Use syscall_enter_from_user_mode_randomize_stack()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCAzOjA24oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21p
emVfc3RhY2soKSByZXBsYWNlcwo+IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSBhbmQg
dGhlIHN1YnNlcXVlbnQgaW52b2NhdGlvbiBvZgo+IGFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgp
Lgo+Cj4gVGhlIGFkdmFudGFnZSBpcyB0aGF0IGl0IGFwcGxpZXMgdGhlIHN0YWNrIHJhbmRvbWl6
YXRpb24gcmlnaHQgYWZ0ZXIKPiBlbnRlcl9mcm9tX3VzZXJfbW9kZSgpIGFuZCB0aGVyZWJ5IGF2
b2lkcyB0aGUgb3ZlcmhlYWQgb2YgZ2V0L3B1dF9jcHVfdmFyKCkKPiBhcyB0aGF0IGNvZGUgaXMg
aW52b2tlZCB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+
IENjOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KPiBDYzogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgICAgNSArLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCj4KPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+
IEBAIC03LDcgKzcsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFmbGFncy5oPgo+IC0jaW5jbHVk
ZSA8bGludXgvcmFuZG9taXplX2tzdGFjay5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVnLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zY2hl
ZC9zaWduYWwuaD4KPiBAQCAtMzMzLDkgKzMzMiw3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0
cnVjdCBwdF9yZWdzICpyZWcKPgo+ICAgICAgICAgICAgICAgICByaXNjdl92X3ZzdGF0ZV9kaXNj
YXJkKHJlZ3MpOwo+Cj4gLSAgICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zy
b21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+IC0KPiAtICAgICAgICAgICAgICAgYWRkX3Jh
bmRvbV9rc3RhY2tfb2Zmc2V0KCk7Cj4gKyAgICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNjYWxs
X2VudGVyX2Zyb21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjayhyZWdzLCBzeXNjYWxsKTsKClJl
dmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
