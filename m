Return-Path: <SRS0=haJm=YJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0D0FA372B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 10:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 260EF20872
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 10:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKmchXro";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="jw4mP6Ux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 260EF20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bMAD85T23iC7Vu1jyiclVeMca+hzgyguck7Yl3lKOo=; b=eKmchXroaTUY3M
	Ks933olfwTV9KEZqL42MhBmcPrwu13kKPrOMMx2LPVwklb/DZ4HY2RqS4sJ8vTKRp35uEwLl1suQT
	WEwKpu+1vviESiW4pG2jS1G/uwxMavcOX4k3aiARu5+Q8agVn5Mmm6VOHM2Hp2aZfgglRQwC0eqHe
	2LfZOjrSZjn9KgaPJbUzNqoEx/qV39rRORxoZyBbJ/jtExHrdT7k214i+gv/NPI3XF6HBMgKg4h5P
	VS9X/ERFJ215MmMfR9RTotvG2T92meC6+mDIN5UZPj355ndAeAEp8XodEnbiCUA8xixkb8HC/Rm5I
	/HMyK2ZSIIuudPSss/VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKged-00054C-6x; Wed, 16 Oct 2019 10:35:43 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKgeZ-00053e-Rp
 for linux-snps-arc@lists.infradead.org; Wed, 16 Oct 2019 10:35:41 +0000
Received: by mail-lf1-x142.google.com with SMTP id t8so16980117lfc.13
 for <linux-snps-arc@lists.infradead.org>; Wed, 16 Oct 2019 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TPx7rPA0Br+et5o6KmRStGO/myFB8ZhOgy82/e79ydg=;
 b=jw4mP6UxdbKOn1Ax/5Lz6J3Yf5tVdATs7EvlFAJS+GhYi7/834ey8w/GvLQpLeZVc7
 7Mb3IXhbnQSlm+QXZ3MZ+nckKcixkU87Dmfefg2Z9rz8pDIfZBDL+OES3N1PpeYo6xU8
 PNyU5vrMcL2T8PAlZ7u7qD0H1U6OF5fCcn7y7a3kIALA9Bqh1plMD2Y9HS6Mm00vbv7v
 xjKALcfBL8p4Z6xSJDAwiS4oeDHxeJA6eDNAP8saYrTaPW6uq2jHilKFYwB8ptI5KkAz
 zT8lgn8Vk55SVZ90xAYBKzEcFI76nh/U52ixpe6wlEk/hmGMD2fliIAFd31J/AcanEeZ
 Jw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TPx7rPA0Br+et5o6KmRStGO/myFB8ZhOgy82/e79ydg=;
 b=ROwI87X2T3hs3NjKu1LfkEwTRr8y97Ess0qZ81vhUdjr+0EIamp/AhTf9W0oArNUlL
 q6IwhFAAEHpcz7PsLpzT/km+GzI1z7e8+GilxBjIiAA0puP+DJWQOxGZ5aq62JsFWiL0
 tURKAxTAJHEXFgqt+74AVEhN1TD0WAYzjD8F4eumNRWdsWg7sKd0CP9MyPTX1md+T+a6
 Mz8fXZd9SG7S5iXlkYdDTrtmaqjNoeyaZtdcOunJ94g+/QxrsD8Wf3xwlNwLxy+0nJtd
 zsYk6NBi5JO9Rj/B6K2f0r5QAXB1NwnKeF7zaenmPfb5JrEVNswO2O3n325Y3lTn8ThT
 wrnA==
X-Gm-Message-State: APjAAAVj6al2qE6ZFJKlvsmJgPty6PQgbqEpbaaqFUPlSixhLfr5RT+U
 8WUzV+6jBc5ONDSFx6kudt1wCA==
X-Google-Smtp-Source: APXvYqwEBdxAChMVVBFlmc6eUXtVvNheuH3e0SluP3ca6bXyqt8wHnILm5brTVtYux5zecvFFwwvVw==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr24763989lfq.38.1571222137941; 
 Wed, 16 Oct 2019 03:35:37 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id k7sm5791404lja.19.2019.10.16.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 03:35:37 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id E4B6C101F90; Wed, 16 Oct 2019 13:35:37 +0300 (+03)
Date: Wed, 16 Oct 2019 13:35:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v2 5/5] asm-generic/mm: stub out p{4,d}d_clear_bad() if
 __PAGETABLE_P{4,u}D_FOLDED
Message-ID: <20191016103537.oeanj7nh7u7yhk7l@box>
References: <20191015191926.9281-1-vgupta@synopsys.com>
 <20191015191926.9281-6-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015191926.9281-6-vgupta@synopsys.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_033539_925599_DF1B56FD 
X-CRM114-Status: UNSURE (   6.03  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nick Piggin <npiggin@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

There is couple of typos in the subject of the patch. It has to be

	[PATCH v2 5/5] asm-generic/mm: stub out p{4,u}d_clear_bad() if __PAGETABLE_P{4,U}D_FOLDED

Otherwise the patchset looks good to me. You can use my ACK for all
patches.

-- 
 Kirill A. Shutemov

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
