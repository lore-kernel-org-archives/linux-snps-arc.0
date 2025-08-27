Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFAECA0FED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Aug 2025 01:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apdUFYoF+NigVLmL+yaYYG8D6lvyqA7BX0CfBPyMsJo=; b=mpwKgd29aZVkl1
	hJyxY2bhbpwAHm7GUIObFko68HUxApVdQ3fYCfX68bLJqfdl0m31Cnv5f3EA6gF6uogFolhpGAWJ9
	lKkjNz4z1kQ5as3ovyuXLiu12h0uccfqLFBRH5qDMsz9H1qhwH9AStt39TT8kcSgimcLdcZK2dAKv
	48lEwGUr7cd4GRDfG9B9mG4sNjdC3+cOLJniYqoVZW1Z7yZJ5xsu4ZyklUseDTYevgYUJvVCW6pjZ
	46H1wG+CZDHTrph0TA813VSBh8NjEy5zPFJLQKh5ho3lrV/dO8b/B64ZQDX1Yr/9/qLrKGVxK4UBp
	j4m6H1tQtoD61e3pGUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4v5-0000000DWub-2sK8;
	Wed, 27 Aug 2025 01:25:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4tU-0000000DWht-0D0H
	for linux-snps-arc@lists.infradead.org;
	Wed, 27 Aug 2025 01:24:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-771e987b4e6so2242699b3a.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 26 Aug 2025 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756257847; x=1756862647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m1eN+RfkD/BZr7YKYuoHDKX/GqHENJ8RA/tRnRlLGTs=;
        b=HG/DJotGuE27+MWdt/opShcpREm66JGqJygz71JzgLcKYmDECohY3y/187Jou/eZQJ
         Jr+vqqBtIRYrqcFAiMbNhANMtxr52aaHULv5n9RvvneIw6bP5lC2XS0DQnpBgP/aE/qP
         W0XpO2fyxocHUAIErZR7+04Vk+phghRTpun9VK8raWr1rSBBIcDe/CbpjzqsRTBN/yen
         MaOK899+DTd+jwVQmlxRY2wZSSa8IPOlBpGob/5mJo/ClBm6+eIEqHjhTB1m0iULIKRL
         daKJtD8kanH4nN5szTsk8Cvn+zKCNvBPGbo16YNlaIE9REfVlCnSRXbxIJsqHiKunNFC
         DlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756257847; x=1756862647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1eN+RfkD/BZr7YKYuoHDKX/GqHENJ8RA/tRnRlLGTs=;
        b=sP87lKL1TmbMVEq2lqpO57AeNIO/JrCZtFLTEgIZ7Y+QN5qpfLG4fdithru3phiIDb
         dNu00PItiKXML+Rtl6sjJgGhkVPhS+GTORjkt5J0yofg7DM8Ptn+yc3KJO0OliGKZBs8
         a7sEwu3VxoKAan2pc/WmUuM8T/CKE5YEaQdnNHFCkHuAAlHEEn5PeMv7V0NWYVMbBKZz
         ooX+cqRTu7LhQEtLehLpY3xz/Z/3eBBK2LWlbM2NSXWebULNGzPHotRPKllJLT8Iq1RZ
         7jxo521nPvDfRLtwgy3edDXfqpWR+ft163nonDu+tfZ+zqju4pBD9fFaUGPhz9qhR576
         gYDA==
X-Forwarded-Encrypted: i=1; AJvYcCVDTdJaOMYR9/BliOBdiSGEk69EPHBW7+5TIgtWJDvmi2/hjprMpOg2AA09AlQBn3sE/wBMjbmUpm3c/gfCbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgCVfx7aJmp0KgyLxuwnMVipHIHrEWZRR/rUxNCZGvPQhjblUb
	Ycb2cixSwcMjT2AP08BIt3EBnJW40S3CvsME1JV26ZLEtEie7FNrV+Zt
X-Gm-Gg: ASbGncsyP/lbxLX2n2tUfREIPLO4FlD637x9a22pBdJQ0B3kOh8MfCuKua0vLiZf7Ic
	T7ci75GI+JlHuwt0yJkYrWNg1pGzViAd+DE6eDS572j7unST7Ux6XIZPjYAImdMtOvr5JgTqwGY
	tdlbaiQr/+soqsR2IU2XXmK9e3TNJ+cL5pg5fK3ZQpJxsftmQG+IJZpxoVYMORG9Fzah1WhmTtv
	qgZLRFrCLxyZMfOAZ66ZY36Y5ZuFP3+XueuY3Wd0B+SO1BlZtzwTJoIA5G1nlihFMozMy2KW29a
	FoC5aKrzauaS1YtV19fu1Ua3Q7KbDWogHn1zCz+4+jaO6Agt84gODArhjS2iIaokuaPt6mDiaf4
	2mFzddlhqsuT12HRBlxoLuD1cYhvDt/Qu
X-Google-Smtp-Source: AGHT+IEh3XZg5923sDjlaQ2nPZzRtgxPNuzgkJG3sCz/aVnRUW5jNGD0fK3hayb5dgJOYYe/t1LQDw==
X-Received: by 2002:a05:6a20:2a29:b0:243:78c9:1631 with SMTP id adf61e73a8af0-24378c94b3dmr9318050637.51.1756257847131;
        Tue, 26 Aug 2025 18:24:07 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49d858ae34sm8328274a12.47.2025.08.26.18.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:24:06 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:24:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Rasmus Villemoes <ravi@prevas.dk>, kernel test robot <lkp@intel.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arc: Fix __fls() const-foldability via __builtin_clzl()
Message-ID: <aK5eNDa5H-PNGHpj@yury>
References: <20250826034354.work.684-kees@kernel.org>
 <87ldn644d0.fsf@prevas.dk>
 <202508260955.2DE50A3FB@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202508260955.2DE50A3FB@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_182408_089025_C4730E3F 
X-CRM114-Status: GOOD (  17.19  )
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

On Tue, Aug 26, 2025 at 09:56:06AM -0700, Kees Cook wrote:
> On Tue, Aug 26, 2025 at 03:08:59PM +0200, Rasmus Villemoes wrote:
> > If __builtin_arc_fls() simply doesn't qualify for attr_const for
> > $reason, I think it would be good to have that documented in the commit
> > msg. If it does, I think a gcc ticket and link to that would be in order.
> 
> I already sent the patch to fix it. :)
> 
> https://gcc.gnu.org/pipermail/gcc-patches/2025-August/693273.html

I'm OK taking the patch if it fixes real problem for you, but it looks
more like a GCC problem, right? Is Clang also affected?

If, say, Clang is not affected, and you expect that newer GCC versions
will not be affected too, let's protect the new code with a proper
ifdefery, so that it will be easier to drop the workaround later?

Thanks,
Yury

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
