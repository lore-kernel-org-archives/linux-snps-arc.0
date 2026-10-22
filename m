Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31200606A319
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Oct 2026 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHZQ8UfF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2kUGpeTG;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rACQg86H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ti7NGCrB+PwEYjvYn1WACnvjOzr8/5uXVyUdXEsmnWo=; b=NHZQ8UfFxgHM2VwOsafL20SklB
	mXS92hWniY+QEnBnAPB6FcKr20BX4vTOoTYgGobHqyHzxv3uqgkmXEGaqxMtEHtI+6LImbU7YlnZe
	NA9QSqQb9pV8wj9RRx8eg2UdWIN2JPXoBqR8vRpKO1Ix8C7m/hqyGRQfUACxXo9LB44RASMRUQiKi
	QTm6w9QRJU3AA2x6eag5w8rk4XOGyBtNAGMicCTm8qqdHCE0G2/mVBY++t+QCZWfSqiE7OI2Vfrkj
	QvoV9KR3pvuOmQSnZHanfG7Cb6t/HnwuLKZjis8ThavHFry3Y+oXkJCrtqjkxlg72ILwoowAvDmf4
	81frRG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuJY-0000000ENCC-3QMQ;
	Thu, 22 Oct 2026 15:02:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuJV-0000000ENBV-23v0;
	Thu, 22 Oct 2026 15:02:42 +0000
Date: Thu, 22 Oct 2026 17:02:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792681357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzBCi/OSOXBVd/hf35Hctx/8s00KKyC8gNB54GWWKuw=;
	b=2kUGpeTGDVBuYHmtDUk+ioLvFvif4ltj8rhWzocDuPm3HaFe4R4vTlOrnH+/NsK85KtmTp
	BQjRWdChCYWAdK0+eKUDRrdj71IFDIxlOzl/dpE7YHJOp63rkeZsrL+lIMWPOayKDZmWQS
	jZAmsd4OLiERAIm81xpmW1yxnaZhra+XaRdURt8feLSfDQkUZypkuicnE2Chx4WDXJq1W7
	gDW8/bA/PN+qgiQxlc+hLTJKpE5MORxYd7/+QpWeOeTOBVrrUrdM+PZPV0PqyhtRPzLVvf
	zZtCZj7gdLMshXYHbUIElhTwDBoSLh7+UVN4FV0jNASdMsB3S53YU8lnjUcMbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792681357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzBCi/OSOXBVd/hf35Hctx/8s00KKyC8gNB54GWWKuw=;
	b=rACQg86HepNQ8r26wtL/lrV9xxe+QpJ6z/mp4SnHXzsO+wI4ld+mzpC3AGpr+fKJ/pFfac
	AwRn+5gmUDC3CcCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Weinberger <richard@nod.at>,
	Chris Zankel <chris@zankel.net>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
Message-ID: <20261022150235.V2CSdtmu@linutronix.de>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org>
 <20261022142425.3Wx-RrU5@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022142425.3Wx-RrU5@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_080241_695314_B1825290 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -2.8 (--)
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

T24gMjAyNi0xMC0yMiAxNjoyNDozMCBbKzAyMDBdLCBUbyBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4gVGhlIHRlc3QgY291bGQgYmUgdXBkYXRlZCB2aWEgdGhlIGh1bmsgYmVsb3cgaW4gY2FzZSB0
aGUgbmV3IGJlaGF2aW91cgo+IGlzIHdoYXQgaXMgZXhwZWN0ZWQuIGhwYSBtYWRlIHRoZSBleHRl
bnNpb24gdG8gdGhlIHRlc3QgaW4gY29tbWl0Cj4gNzk1ZTJhMDIzYjgwOCAoInNlbGZ0ZXN0cy94
ODYvc3lzY2FsbDogQWRkIHRlc3RzIHVuZGVyIHB0cmFjZSB0bwo+IHN5c2NhbGxfbnVtYmVyaW5n
XzY0IikuCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNj
YWxsX251bWJlcmluZy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3N5c2NhbGxfbnVt
YmVyaW5nLmMKPiBpbmRleCBjYTBlY2E3YjlkY2VkLi4xNDM1Mzk0ZmJhMDIyIDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9zeXNjYWxsX251bWJlcmluZy5jCj4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3N5c2NhbGxfbnVtYmVyaW5nLmMKCk5vdyBJ
IG5vdGljZSB0aGUgZml4IGRlcGVuZHMgb24gQ09ORklHX1g4Nl9YMzJfQUJJPXkgKGZhaWxzIGZv
ciA9bikuCkJ1dCB3ZSB3YW50IHRvIGdldCByaWQgb2YgaXQgYW55d2F5IHNv4oCmCkNPTkZJR19J
QTMyX0VNVUxBVElPTiBpcyBub3QgYWZmZWN0ZWQgKHdpdGggdGhlIGZpeCkuCgpTZWJhc3RpYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
