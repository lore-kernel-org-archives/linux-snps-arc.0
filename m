Return-Path: <SRS0=2Xzh=DN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62DEC41604
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 20:23:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4700E20674
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 20:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="exUXLa+w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b4ssUvuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4700E20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xn6i7d+J0gORchhxHvlwrY6S5Nydrh7wz4O50CL+QRw=; b=exUXLa+w2OSo2KWaAgBARUbV/
	o3hkQWH+kyyOln7Av/TbyAgX3oEcRyOiSOtrF1XXTpFGodoYTR0LwMWp4DtxKfECkGwevNe4v7DZN
	XsVzxvZWR3YwOFfxuugA9EFYWFrrIe+JlVi+OUWy4PpiSSLN2qWJiw9BMNpaa0Z0+VXwqBAqDSyJf
	6CEG1opVPGI5JXlklQtRCb3+K+gAwipOysFubaixumJ2W6j6FtCPktXlTumNqXx095aCL+D/lRQ4z
	UJEUh8tXbTUDUbp9isPDiOLHI/K3lupLshMFkpbQJiADOtxU80aQeJZ/RWT8ch4V2ivbBhMEP7kMo
	SHToNSHkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPtUx-0008ON-94; Tue, 06 Oct 2020 20:23:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPtUw-0008O9-DP
 for linux-snps-arc@merlin.infradead.org; Tue, 06 Oct 2020 20:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=l8q5XJeNH8/bVLIXZvnvF8loo3S7vmtNcXgo0ZhJTNs=; b=b4ssUvuOvp56fjYvJtEpG015TG
 xwQAlJLWrrxKXCzLoYtuhYoC/r6ZO/CkZpbSDhWI+gcCxoDd7SUDw7Cnso9ej/3SDMNolFX9FDcWx
 xxqWAWWR3Gp0L6WfEt4+SQ+hcoGWKjbprHgyctpIg6sElW69b97uL3L9S8VGOF1RRxXTpwaK9MbPC
 z9bfK+2KK0rUMw+kG89LCAxuCeJwvOa3oDrJhhyRSDST842/exidcJW3vDt/161QTaFEFiqO4eVkj
 DvXZj2+ZWEVi9h/oWhLGD3tCXfkFf12006J48O6QowWgp4iIKcGDZHTuPO/b7Vc6cobMFuRjks49O
 cj7dcT/Q==;
Received: from [2601:1c0:6280:3f0::44d4]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPtUn-0002Y9-V3; Tue, 06 Oct 2020 20:23:39 +0000
Subject: Re: [PATCH] drm/amdgpu/swsmu: fix ARC build errors
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20201006132659.1486610-1-alexander.deucher@amd.com>
 <20201006132659.1486610-2-alexander.deucher@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <816c65cc-23cb-0295-a679-adc0d48091a9@infradead.org>
Date: Tue, 6 Oct 2020 13:23:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006132659.1486610-2-alexander.deucher@amd.com>
Content-Language: en-US
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vineet Gupta <vgupta@synopsys.com>, Evan Quan <evan.quan@amd.com>,
 kernel test robot <lkp@intel.com>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/6/20 6:26 AM, Alex Deucher wrote:
> We want to use the dev_* functions here rather than the pr_* variants.
> Switch to using dev_warn() which mirrors what we do on other asics.
> 
> Fixes the following build errors on ARC:
> 
> ../drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c: In function 'navi10_fill_i2c_req':
> ../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]
> 
> ../drivers/gpu/drm/amd/amdgpu/../powerplay/sienna_cichlid_ppt.c: In function 'sienna_cichlid_fill_i2c_req':
> ../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 14 ++++++++++++--
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 14 ++++++++++++--
>  2 files changed, 24 insertions(+), 4 deletions(-)

Works for me. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


-- 
~Randy

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
