Return-Path: <SRS0=i8W8=3R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F00C3F68F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 07:07:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A17B24681
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 07:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBO1wkTK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="HLqlIR1y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A17B24681
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+UOu5JtgsxljEbEya2crapgwE/lFoc5x+GuSNVOr/g=; b=iBO1wkTKZtUs7E
	FCx7rUKzlTgwW2KbQgk3ge8hT5oNPGtB5ing8KTx5yRkfagGQnugAvxP9Ql/UzXUH8OT0uaiwNbdM
	3QyL1w3iHQ179BeIjGwvLPKULz4gEzO0dFf4Vk1X60wxTjCZXLcjstfcCoE3w5EDw3bBot//PYhQF
	3itDNZQUq8qxMAozVnCyu/3EPiRtcCBIpqygD+28CUoEAFLwMlZzsr+1uBNZFLc/DVyGE0Mn7t/jV
	iNsmTmpELOkbtLqxtN/b4j0trACeiLbON5mL7SSGngrNv4Lmzx2Fhqs9bCKLx3bGEAmyqw51cC2eB
	xBs6yiT9oLcf/t7vuCYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwKxs-0007on-9M; Tue, 28 Jan 2020 07:07:12 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwKxp-0007oE-UQ
 for linux-snps-arc@lists.infradead.org; Tue, 28 Jan 2020 07:07:11 +0000
Received: by mail-qt1-x842.google.com with SMTP id d5so9533006qto.0
 for <linux-snps-arc@lists.infradead.org>; Mon, 27 Jan 2020 23:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=S88X9kdR1m457FxjowRY1cG95Ez9+awfEFeNZBzBj5c=;
 b=HLqlIR1y5B5/PsLNv/5LbKmkRD0LOfvs+3Uw5UFR8XmB3CZjk35sCKEGU7QUrB0DXx
 ro3J8jPDeF5kpX6rK5bqvFjVyygmmBxTqc+U9+GqB6XkJi7vq8NcYRCERMAEMhDVXUCh
 582xGO5f2XyXtpU5uRDgb4Bc99IiX0ZDjMomKpIHbbLRjRqqVt+qwAOuBjm+lP5W2SJ+
 vCTV/46saWz+DSrfHpwXbiE5Bw1kdqVnfBTP+u5/moAx6Z3f1YyRVCqjbBB5F8ReCJuz
 rLNiGsK+2jKaexspyfqYWjO7Gf6gMQ5SLYW8N1k3kz0BSFSsLmhau83aEBKEGep3vOtX
 Tp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=S88X9kdR1m457FxjowRY1cG95Ez9+awfEFeNZBzBj5c=;
 b=ruwY7Wbgm4QktLbBDEs3GlxkYZd6a4gkBp7w/yR2Ou532rfC9pXQmwiS0O0/3r/p05
 W8G5tFG/+yUrmRfZHL9JMkxq1AE9iWZLClfkiHjH40IZJ+RuQlFVees87XIkHTMsrOkq
 Ja5nzvd86Sn4fy9u5PJ3D8Tz6h0kny9jdYnqEdbcIZyJDs+TFCgf24cZPo80r+b1NjEF
 qb/I6RpgSiSz6TvqL+Y0u6tOdCaHvmHJ5l3AuLGFqVjNER8+W98I7uBNfrzo+G1RMbT0
 E56Y+Eb42PQp7Xo58AInsLtqhndsj2osx/PGnn+XKaUpDA9EkpeXqbqg3CvkOg5D/ypl
 gB8Q==
X-Gm-Message-State: APjAAAWXnXthNksAEngasPQ8jCZuTSE78vl4w6vYRx/rnTtyG9n/Td8f
 Dx+ZVTEJObcGlzbhbVfCoy9grQrAA0FLmA==
X-Google-Smtp-Source: APXvYqwjL/tF2WR3QmLuG8LOj7E2zvaXqRI6bLl13yd8OQ3r0ofRKuuNBE3aHo9M+hTpUmSXvKe5+w==
X-Received: by 2002:aed:3fce:: with SMTP id w14mr20841113qth.0.1580195228489; 
 Mon, 27 Jan 2020 23:07:08 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id q130sm11341027qka.114.2020.01.27.23.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 23:07:07 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 02:07:07 -0500
Message-Id: <C0CC7DB9-5B58-40D3-BE7A-D15B3738C971@lca.pw>
References: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
In-Reply-To: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
To: Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_230710_030543_9FD404C5 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIEphbiAyOCwgMjAyMCwgYXQgMjowMyBBTSwgQW5zaHVtYW4gS2hhbmR1YWwgPEFuc2h1
bWFuLktoYW5kdWFsQGFybS5jb20+IHdyb3RlOgo+IAo+ICdhbGx5ZXNjb25maWcnIG1ha2VzICdE
RUJVR19WTSA9IHknIHdoaWNoIGluIHR1cm4gd2lsbCBlbmFibGUgJ0RFQlVHX1ZNX1BHVEFCTEUg
PSB5Jwo+IG9uIHBsYXRmb3JtcyB0aGF0IHN1YnNjcmliZSBBUkNIX0hBU19ERUJVR19WTV9QR1RB
QkxFLgoKSXNu4oCZdCB0aGF0IG9ubHkgZm9yIGNvbXBpbGluZyB0ZXN0aW5nPyBXaG8gaXMgYm9v
dGluZyBzdWNoIGEgYmVhc3QgYW5kIG1ha2Ugc3VyZSBldmVyeXRoaW5nIHdvcmtpbmcgYXMgZXhw
ZWN0ZWQ/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25w
cy1hcmMK
