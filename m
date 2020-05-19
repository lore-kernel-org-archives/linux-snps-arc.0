Return-Path: <SRS0=mq+M=7B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572CCC433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 12:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 281592081A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 12:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DZJqTS2B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNDVxX4v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 281592081A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejogiA0nfgu2tfhZNKpJYypwbVaT6pOMfWicxzIjxH4=; b=DZJqTS2Bdm0XHv
	0Uk6kLfCUE4k1b2T4BS2ceVitvTV/HlmbQWAzyuiz9R1QDYcvv4vJ8FUXtisXhULJX2mfYSfCcTTP
	txjsk3ZCyII1fpceb6+xj1IgJS8E+RoiIVKVneso47tqVAm/+LWXGXstIVP/0+vVfzskMiROlh0ss
	1F5wkhcMQO7Tfz+e/qMl5Io8u7f7V0499ICwz/ETgBulRldx+s1hXNlFInLH3nUDlnAXIqH5Ce4ve
	MulM6bxqz9yalMNJOC8vCYkPl1BC6nlpTdhVfaJsOAsvVeCwsK5qduFSlNjcJXDVQjmeLtU1dI9UC
	LjH23yzMGYQq1jZ15XuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb1Dn-0007ce-2f; Tue, 19 May 2020 12:19:47 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1D9-0006xR-Gb
 for linux-snps-arc@lists.infradead.org; Tue, 19 May 2020 12:19:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id m12so2851853wmc.0
 for <linux-snps-arc@lists.infradead.org>; Tue, 19 May 2020 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=p60TB+Tyypr34A8h+yZQiNDu/fhAf7U+hPUWshuyPPQ=;
 b=fNDVxX4v/9yZjo6Ka/JZWCNnCthl0wRZ7qHbp9YiiWJnDSCwAOJZrvnfS2IBFci2iT
 GxDcpsIq4HJ26zb2iLdrWraDMFawnKOHbxfRGif5vGQtBb95kjErhuREsyAvTHO8xXw+
 0IlbCky1b86HJu+2SMmZNwPpQGd3YCCKsqPlXZW7vt2XbFOMkdGhn2UL9FlN8cGUvdYj
 RHSdcxZYOqZoKHJF4CjKWwMcUMYyuSV3pE0Bx793YSlWsSRMm0zn0B2O+7DIv1ZcQtMB
 K39A2AS5//Yv8xUYflkIsmUnlswZeMit//r6ivmRZIBVy8fmvcB2kyHQnZP2wNIFPY+F
 LvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=p60TB+Tyypr34A8h+yZQiNDu/fhAf7U+hPUWshuyPPQ=;
 b=PlQxmxLMJYXzro2KN4URKW5xN6l4R5VSjsRLqdrg6vhPEC5xYyTOgf3SOHEtWrSWuy
 vhM91cJHwVgVp6JE32qGrp90PsoV661Ig33m+hbr09hdXj2nKcAYes62yxDFwJ7anJ0e
 CkTgKgNnSamw4TwQFmF2D/bhpaks2/ZLYarC+2DKFFCod5l9fuSXXYnI/9YNUph8xBaN
 vVMmt9JTJ8Fv9Bmd3Gs9XL3He62fRc02S6qy8SFFtpMLfbOrAydjTTjI3sCEKYyLPQql
 O5lS9q2OZJP4bXGesrCQpHTLRfAJLaVnSexROVUS0VrGU8Z4rl2aDTq5B4TWXHOd4dF2
 +XtQ==
X-Gm-Message-State: AOAM5306/flsPW9M8R2KglgTXYCqV8uiK40K9qXRZhHBgBrsy8jkHG2O
 so1BP1MOlSstHpHdc/VS8B8=
X-Google-Smtp-Source: ABdhPJxF9SfebJ0+Qelp9N3dfeat3xZSDZwELOBS8RqyzDKPS9DM4f79WmvUaB+iKCUi2iTKDF69fw==
X-Received: by 2002:a1c:4088:: with SMTP id n130mr4994461wma.43.1589890746219; 
 Tue, 19 May 2020 05:19:06 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id d9sm3763163wmd.10.2020.05.19.05.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 05:19:05 -0700 (PDT)
Date: Tue, 19 May 2020 14:19:03 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Subject: Re: [PATCH v2] Kernel selftests: Add check if tpm devices are
 supported
Message-ID: <20200519121903.GB26265@dell5510>
References: <20200519120743.41358-1-Nikita.Sobolev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519120743.41358-1-Nikita.Sobolev@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_051907_585960_E9DA4B56 
X-CRM114-Status: UNSURE (   7.11  )
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-kselftest@vger.kernel.org, Tadeusz Struk <tadeusz.struk@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joey Pabalinas <joeypabalinas@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-integrity@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

> tpm2 tests set uses /dev/tpm0 and /dev/tpmrm0 without check if they
> are available. In case, when these devices are not available test
> fails, but expected behaviour is skipped test.

> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
OK, I see it was also reverted by Jarkko

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200518&id=aaa2d92efe1f972567f1691b423ab8dc606ab3a9

I wonder if only wrong shell syntax (self.flags = flags) is a problem.

Kind regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
