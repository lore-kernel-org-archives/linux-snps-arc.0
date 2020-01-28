Return-Path: <SRS0=i8W8=3R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99805C33CB3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 07:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1AD2465B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 07:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2UIa8/O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="RmoEayVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E1AD2465B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuQUt+sqAfPkXnuN0d9WkKO3glEa8tMBlEiVjZJGt1Q=; b=p2UIa8/ODlswKB
	PwRy2pCS5RHPogHvH8+rDWQ2BUhrpVzCLFFGsHOhDwTRC/P3SgLQERg9LbzvR+vQ7Qg/ETVpWtpmV
	FPTfRuI2bMxyd9+KAXRzVMTm8cV0q31ddpQpKYl0plHdQ0GgnW8mpgB/wliMhfXGV6uFS33qRblbG
	oU+t8pfz7F5CuYV1cseFv/DHvgDds2NBvJ/NSADT9evlxWBIq7aN75JhiY9e1SdICfXkYFE5j6fPe
	sp/BY217vIHUaZMobJ+mxHNuppVqXjmVouVNMjBUcgeniIiBuf72/ZL6lJyE8F95hvbFYGXsTP2Q7
	IOFiCYa0W6HDKYQ8F0JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwL3f-0001eQ-1F; Tue, 28 Jan 2020 07:13:11 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwL3T-0001Rp-Uw
 for linux-snps-arc@lists.infradead.org; Tue, 28 Jan 2020 07:13:01 +0000
Received: by mail-qt1-x843.google.com with SMTP id d9so9488757qte.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 27 Jan 2020 23:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=qKA4UjioXFc27zR8c2yU7DKOhu3nMjpZIq48GcXCB6g=;
 b=RmoEayVYUYqFJblJjIh2uN7kKQmME+y9qMPPUAS2F75g/qPxCehTcmMRH2ge8tD4CC
 GQDWfmy38oVlt13IpEPzfTJGsLQXsq1gDyu3NoJNll2CaNkYdTxXz7pUJN2PlgBCQkzr
 ixOQcgD/jWefyEStVZYEzc+BSTXwnZwklPhwdX/B6Cbrc4l/QVK10xPmQO0Qt6VvxdQT
 ziJY9PgEd6H2+XCfOzRdETkAmZErEBWCkltXcleoXo/oHCehLwvLLErnxEW4xJx6a/0a
 igVVZvv1THX9+TtCIsBpUqBjFmoq8tgeHQDzVMftknmCDfuDqnXoun4BF19nE9j/tt4x
 rjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=qKA4UjioXFc27zR8c2yU7DKOhu3nMjpZIq48GcXCB6g=;
 b=MAHyR6n+axdj/oA03/CY17Ocs/jFwYFvSQwAKYt7OM0mYlsFIR6K1LBnzoGE49NYVM
 mhSVq0Mj1qRzWT04D7ciOzHWRS1TnQHA7ni3QVR6bQoDBwHIkoB7/VycegkXqz49KC14
 bpSDyEnZ66c0B2dj618wg2zVi77jhmVm1VY43xQQfLWub8lmZj1Scb76sTg3bzf9MKso
 H+ANKVmdQCmv3I29lE+3V3Tq8GSdyoSaDt/NomPryggl9gEyQAknTvDrHmg763Jjdqg3
 cqljL+avnesx3PkT4WY1SdEAF9SFSTPcBX5c9Fh3H1G0wRIFW+ZcO3jRchcbuORA0WGW
 z12w==
X-Gm-Message-State: APjAAAXgkSgu9ILuQr6EZTlsXjiZRakH8w9WC63KNSUIWnitBWu5wRvl
 dV/py7W0FVjtH1VlBwyu0wPzuyB8KLjegg==
X-Google-Smtp-Source: APXvYqxXDFn+55Cbaf2UqBVqTFuREFEorSGuAtTGsaQy+PPAoTQF0xb8VLQhlT+h7JaiQcuNWDyViw==
X-Received: by 2002:aed:3109:: with SMTP id 9mr20529841qtg.166.1580195577905; 
 Mon, 27 Jan 2020 23:12:57 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id z8sm11967722qth.16.2020.01.27.23.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 23:12:57 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 02:12:56 -0500
Message-Id: <144F3894-7934-4EC7-A9F9-C6A84CA08C65@lca.pw>
References: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
In-Reply-To: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_231259_992685_1BF3CD3A 
X-CRM114-Status: UNSURE (   9.44  )
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
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



> On Jan 28, 2020, at 1:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
> ppc32 an indecent / legacy platform ? Are you kidying ?
> 
> Powerquicc II PRO for instance is fully supported by the manufacturer and widely used in many small networking devices.

Of course I forgot about embedded devices. The problem is that how many developers are actually going to run this debug option on embedded devices?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
