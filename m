Return-Path: <SRS0=BC9U=LF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BF9C48BD1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:31:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1097D613CF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Jun 2021 17:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1097D613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Z2A7fNo/6Ryeyi837A7DQE1S3XQWXBCkVX8Ca9jzdw=; b=aXVmCA1jlPtqh+
	WRrIa8+SH5zI9SrepVu/JvxVIgfOuspmCCzQoTdD9C/DYK8JvN99BNgMRWjZGI56htdxMSaV1C0xq
	GWOWruFaO1yAgfBMbzCfSrwMMPGh/E45dULup362T5CMU1JtWnkXkzZ1+70ThfeiG6szFq7BNt0ZB
	Wc4kx0mZ0UlsW/FHKwk2IUsuI6j8XxCsWgnsvE6Zo39eN7kchuSd/0JOhLa/XVcRcXRaHHEslNMjC
	iIW/QtSWkwXo0kT5khDPSiqKLqzH8KmJr9Y2qV20+FnuS0jvc/YEd/9gZNabM7OOUF1fpt+VHz+tY
	ZX1so4KXX92oQaP52+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrl0B-006Kcx-K2; Fri, 11 Jun 2021 17:31:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrl08-006KcG-Vk
 for linux-snps-arc@lists.infradead.org; Fri, 11 Jun 2021 17:31:26 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s6so37978561edu.10
 for <linux-snps-arc@lists.infradead.org>; Fri, 11 Jun 2021 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbrsGcsXQ6T71SzG5uCShx8LY11EI1JgozIwFmmltDo=;
 b=AAchRZ7KweU2gfGe4IgBPn24OPBBPga9U8O1/ncAqG5oFCKGsNCUqMWpZSm7v4qbxN
 cGftxhiIpg2SDdmmtBluwbblrNN7i/jI62+t5BrJhJmSRb52y1HZLigvkEa4z3VFVS48
 8e6skyXDm9X8uI6X78mdi5knneL7tu9gPaW9bCBuAQmH7/2XuqvunTF4i3QAokfImfvv
 Z5hh/8+yB381T7XtB9IxC5VzC+yDKQsjKhu0VLCphbkuxMijd7KZS4a0FVvTFB+SSNgz
 pBUijtA6DQ+z0o4cvEyOqXj+VwQ4Tiq9UHEXPBPEi97vJxyusGgQ43n67J5B2PekkfNt
 Ufog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbrsGcsXQ6T71SzG5uCShx8LY11EI1JgozIwFmmltDo=;
 b=pud03f+zWagOFLSFnBHOaL/pGAv8M60xyXXXXLBZ5ydoIs789HDQ1DyHsLa09/itea
 b+egndpyIsRVTwArg7lv8PCOAC9GXUNBTF7CoPy78oeqQdfgu6r1JDP42CGiy/XGWH1m
 hjWHXkq3ZOBOLxFQTAuVraiAVnF8j7VdfRyINzXdTKZCDYoBCJvNtg/LjDleRNVVDlDW
 KuOYueS4wJwepV/dlfSAjewIZN7bMocbeVBf0raFfbSdzcYbGneUN357TSjO/SW/VTwt
 cfuUBYFRuZrO54zCPBZTjtLWkCZYE/vJT8QkXNI/quI3r+ZCtEgDE04DYozWSGlaZr7d
 9xag==
X-Gm-Message-State: AOAM530csLILsHml9ACOF58yOxCZt3M+khXwjbp9cCwBHSIGZJhrAN8+
 PncDYUxln97Hq270UvT0kFZeIohqMCEiYmnh2z0=
X-Google-Smtp-Source: ABdhPJw6+5VixHzNAvdEFptYXuRvbg66iVv3FYMhOjxPG0cLhlo3iiW9Rt+B+nwj2Oap5Ith7EHsnwl/7rsrVkGhUMU=
X-Received: by 2002:a05:6402:1763:: with SMTP id
 da3mr4984399edb.352.1623432683697; 
 Fri, 11 Jun 2021 10:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210531201641.2804-1-abrodkin@synopsys.com>
 <20210602210146.GA26712@gmail.com>
 <PH0PR12MB54014FDE72F1682196FEF1C2A13D9@PH0PR12MB5401.namprd12.prod.outlook.com>
 <PH0PR12MB5401FC57FA40A239F8CA20FFA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
 <CADkTA4MY6iMDr4e+qxJzOimUyzDFVGTjr80W698Xm70WkLEgJQ@mail.gmail.com>
 <PH0PR12MB5401A764F799B18F11AA578BA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5401A764F799B18F11AA578BA1349@PH0PR12MB5401.namprd12.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Jun 2021 13:31:12 -0400
Message-ID: <CADkTA4NdaWrxfOr9sDKrUDj4+ssACtgxU2TN5kDWegdeubeH=g@mail.gmail.com>
Subject: Re: [linux-yocto] [PATCH] ARC: Rename nSIM HS to HAPS HS
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_103125_065914_86164B5D 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Jun 11, 2021 at 1:00 PM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Bruce,
>
> > The author as it comes in on your patches is rejected by the yocto git
> > servers, so yes, it had to be fixed up.
>
> Do you know what needs to be done to get that fixed?
> I hope to keep sending patches from time to time
> (and was about to send yet another one just now),
> so would be good to make things simpler and exclude
> that manual fix-up step.

Did you send the patch via git-send email ? And what smtp relay did
you use (if that's the case).

The patch had a "via lists.yoctoproject.org" in the author, and that
is what caused the server's pre-commit hook to reject it.

Bruce

>
> -Alexey



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
