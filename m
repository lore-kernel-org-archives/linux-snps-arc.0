Return-Path: <SRS0=73lZ=AI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57946C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 03:06:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DA020773
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 03:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HEr2Yyq1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGSSgpkE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23DA020773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y/xvbYMW1+Aa4gumbk261uQ4XXEgxSMx2zCP+WAabiY=; b=HEr2Yyq1Oh+iOp63w49rVTO4v
	ReeuqppWyUVNqH9ACp9rwiv8SJjzMdq7XjKbYeStoYTL8ETsgnOi3xNpOLYS3y1uNJi9I3GLkUyyV
	jiKoSrgr5ExRqlC2Nk/B6LrNCI+1br/QOxnrZ6BUXx5VAN1PL/5kcKtFtgTL24B3SY4N+qYLgAvzG
	WN4V0wdGXZRPDX5DqwVaifB2eIqI4bAPsDDosTxCq8R/qdn7s7N0HcxDe2ld8rT2cN+c4t5OvbyuU
	K64fReU/RiSoNdreFm0/nck2j8s4/54SXBLGOJ3P0j2siDdCQjLGlC2lR2TE9g4x8GX7tJuL/CUl/
	+mpQIj2kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp1B8-0002dA-1U; Sat, 27 Jun 2020 03:06:54 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp1B5-0002ch-Vg; Sat, 27 Jun 2020 03:06:52 +0000
Received: by mail-qv1-xf41.google.com with SMTP id t7so5388112qvl.8;
 Fri, 26 Jun 2020 20:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+vuS6c1B6RhJf/Wc0BlkKUed8Ad7RKtG6ySIxBvmEW4=;
 b=gGSSgpkEGydgQhXoMv3qlsLt5mrlAk1v4a9rb3qIZhmM949nYvicKoTtRuPavC2CPS
 4gqA1cK6C7En4OrR24pSzu/xs4Q8Gi1+rCDB936ZFtDq7qeIhGdqLhX3QVnpV1gh8i9r
 Yr+oBV7orOZer/ucN8JKx+INZnGVhvWI3lJGYoToY83TNPCD/UDAOaXkBbXLVet7FzJU
 YdFda7nN//WQKfslSPDlW95hAsPb2mC0SvZh10iM7adIharPZOJYAapANRg5t3Qkk2Sr
 ISnw9Cflf3OgJKj3vsBG2CTZKXRPGRjLof1FkbQqiDaWgHWLcla93tfKhCRAOkB8QJ9C
 IkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+vuS6c1B6RhJf/Wc0BlkKUed8Ad7RKtG6ySIxBvmEW4=;
 b=OQyqvyRckIb6YHEi64zcdFxOQpRE+W6goEbyW1JOw3BdUWQqOgwDGS4dMxJZMR7EJS
 /NM0hqDjqREV9jlyj3TiOJHaCQ20grn3WRa+oFSUIbjTYFZfCc1sJ8wO/hPimHlKfSAz
 9J1baD/PCnPfdOyeQ19JmuxTERecKj4a4ytPlBAWuB0NqVmWW4sHUGcNeVXj6bND15nf
 DDvYPb1RIFXWm3nvnspEIIuqUmo47WEgo1WkbgghF3jnDLGqCeTZp8+vLDMgdLJXlowU
 FVXagill+ptd5jJ4txAUQlarlWp5DjSTW3u/KJupIsihYT33B9G7axfXI2KymnVB6tdA
 IlZA==
X-Gm-Message-State: AOAM530xA6dZDUsw5SzN1DjikUVYImjcc3MTX4EEmVjMNmSk1nHh2dRe
 d7pVZm0YGordIXn5eSmPRzHKsGmfxnc6phTH7+E=
X-Google-Smtp-Source: ABdhPJxYyEJ7kBLOC8G+2pCCNUUQ5BD2x0Y5L6IFg/2fsP6u4dRXqSou/wb4e51wB+OOq8JrNYw66PMvbKNI3NbZUFA=
X-Received: by 2002:a0c:fe01:: with SMTP id x1mr5934189qvr.246.1593227207936; 
 Fri, 26 Jun 2020 20:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-17-christian.brauner@ubuntu.com>
In-Reply-To: <20200622234326.906346-17-christian.brauner@ubuntu.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Sat, 27 Jun 2020 11:06:08 +0800
Message-ID: <CAEbi=3f3o5jS7zZDo50Vq857mS9n9kDsxkseGKrWshmmp3q5wA@mail.gmail.com>
Subject: Re: [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
To: Christian Brauner <christian.brauner@ubuntu.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Q2hyaXN0aWFuIEJyYXVuZXIgPGNocmlzdGlhbi5icmF1bmVyQHVidW50dS5jb20+IOaWvCAyMDIw
5bm0NuaciDIz5pelIOmAseS6jCDkuIrljYg3OjQ25a+r6YGT77yaCj4KPiBBbGwgYXJjaGl0ZWN0
dXJlcyBzdXBwb3J0IGNvcHlfdGhyZWFkX3RscygpIG5vdywgc28gcmVtb3ZlIHRoZSBsZWdhY3kK
PiBjb3B5X3RocmVhZCgpIGZ1bmN0aW9uIGFuZCB0aGUgSEFWRV9DT1BZX1RIUkVBRF9UTFMgY29u
ZmlnIG9wdGlvbi4gRXZlcnlvbmUKPiB1c2VzIHRoZSBzYW1lIHByb2Nlc3MgY3JlYXRpb24gY2Fs
bGluZyBjb252ZW50aW9uIGJhc2VkIG9uCj4gY29weV90aHJlYWRfdGxzKCkgYW5kIHN0cnVjdCBr
ZXJuZWxfY2xvbmVfYXJncy4gVGhpcyB3aWxsIG1ha2UgaXQgZWFzaWVyIHRvCj4gbWFpbnRhaW4g
dGhlIGNvcmUgcHJvY2VzcyBjcmVhdGlvbiBjb2RlIHVuZGVyIGtlcm5lbC8sIHNpbXBsaWZpZXMg
dGhlCj4gY2FsbHBhdGhzIGFuZCBtYWtlcyB0aGUgaWRlbnRpY2FsIGZvciBhbGwgYXJjaGl0ZWN0
dXJlcy4KPgo+IENjOiBSaWNoYXJkIEhlbmRlcnNvbiA8cnRoQHR3aWRkbGUubmV0Pgo+IENjOiBJ
dmFuIEtva3NoYXlza3kgPGlua0BqdXJhc3NpYy5wYXJrLm1zdS5ydT4KPiBDYzogTWF0dCBUdXJu
ZXIgPG1hdHRzdDg4QGdtYWlsLmNvbT4KPiBDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3Bz
eXMuY29tPgo+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiBDYzog
Q2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBDYzogV2lsbCBEZWFj
b24gPHdpbGxAa2VybmVsLm9yZz4KPiBDYzogTWFyayBTYWx0ZXIgPG1zYWx0ZXJAcmVkaGF0LmNv
bT4KPiBDYzogQXVyZWxpZW4gSmFjcXVpb3QgPGphY3F1aW90LmF1cmVsaWVuQGdtYWlsLmNvbT4K
PiBDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gQ2M6IFlvc2hpbm9yaSBTYXRvIDx5
c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD4KPiBDYzogQnJpYW4gQ2FpbiA8YmNhaW5AY29kZWF1
cm9yYS5vcmc+Cj4gQ2M6IFRvbnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4KPiBDYzogRmVu
Z2h1YSBZdSA8ZmVuZ2h1YS55dUBpbnRlbC5jb20+Cj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gQ2M6IE1pY2hhbCBTaW1layA8bW9uc3RyQG1vbnN0ci5l
dT4KPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4K
PiBDYzogTmljayBIdSA8bmlja2h1QGFuZGVzdGVjaC5jb20+Cj4gQ2M6IEdyZWVudGltZSBIdSA8
Z3JlZW4uaHVAZ21haWwuY29tPgo+IENjOiBWaW5jZW50IENoZW4gPGRlYW5ibzQyMkBnbWFpbC5j
b20+Cj4gQ2M6IExleSBGb29uIFRhbiA8bGV5LmZvb24udGFuQGludGVsLmNvbT4KPiBDYzogSm9u
YXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+IENjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxz
dGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+Cj4gQ2M6IFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPgo+IENjOiAiSmFtZXMgRS5KLiBCb3R0b21sZXkiIDxKYW1lcy5Cb3R0
b21sZXlASGFuc2VuUGFydG5lcnNoaXAuY29tPgo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+Cj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzog
QmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgo+IENjOiBQ
YXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiBDYzogUGF1bCBXYWxtc2xleSA8cGF1
bC53YWxtc2xleUBzaWZpdmUuY29tPgo+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPgo+IENjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPiBDYzogSGVp
a28gQ2Fyc3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+Cj4gQ2M6IFZhc2lseSBHb3Ji
aWsgPGdvckBsaW51eC5pYm0uY29tPgo+IENjOiBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50
cmFlZ2VyQGRlLmlibS5jb20+Cj4gQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+Cj4g
Q2M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0Pgo+IENjOiBKZWZmIERp
a2UgPGpkaWtlQGFkZHRvaXQuY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0Pgo+IENjOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5j
b20+Cj4gQ2M6IEd1YW4gWHVldGFvIDxneHRAcGt1LmVkdS5jbj4KPiBDYzogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQu
Y29tPgo+IENjOiB4ODZAa2VybmVsLm9yZwo+IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IENj
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gQ2M6ICJNYXR0aGV3IFdpbGNv
eAo+IENjOiBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KPiBDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1hbHBoYUB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtYzZ4LWRldkBsaW51eC1jNngub3Jn
Cj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHVjbGludXgtaDgtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UuanAKPiBDYzogbGludXgtaGV4YWdvbkB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGludXgtaWE2NEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbTY4a0BsaXN0cy5s
aW51eC1tNjhrLm9yZwo+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+IENjOiBvcGVu
cmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBsaW51eC1wYXJpc2NAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4gQ2M6IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gQ2M6IHNwYXJjbGludXhAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgteHRlbnNh
QGxpbnV4LXh0ZW5zYS5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hy
aXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KPiBbLi4uXQo+IGRpZmYgLS1naXQgYS9hcmNoL25k
czMyL0tjb25maWcgYi9hcmNoL25kczMyL0tjb25maWcKPiBpbmRleCA3YjZlYWNhODFjY2UuLmUz
MDI5OGU5OWUxYiAxMDA2NDQKPiAtLS0gYS9hcmNoL25kczMyL0tjb25maWcKPiArKysgYi9hcmNo
L25kczMyL0tjb25maWcKPiBAQCAtNDgsNyArNDgsNiBAQCBjb25maWcgTkRTMzIKPiAgICAgICAg
IHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+ICAgICAgICAgc2VsZWN0IEhBVkVf
RlRSQUNFX01DT1VOVF9SRUNPUkQKPiAgICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNF
Cj4gLSAgICAgICBzZWxlY3QgSEFWRV9DT1BZX1RIUkVBRF9UTFMKPiAgICAgICAgIGhlbHAKPiAg
ICAgICAgICAgQW5kZXMobmRzMzIpIExpbnV4IHN1cHBvcnQuCgpIaSBDaHJpc3RpYW4sIFRoYW5r
IHlvdS4KQWNrZWQtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW4uaHVAZ21haWwuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
