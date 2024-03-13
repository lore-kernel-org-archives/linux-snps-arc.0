Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C7DC54E58
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Mar 2024 03:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwze867XXVT7e1twRNbpSEa/x17DwBPeviKzebkJyBo=; b=LIX5xANqDO+A68
	4sb3nIjOeamUrZCEdDnaCtQZFRGy11qIShyoLKBuUv/0S8zQnp83DFywr4X23rta5rW+73+59ghrA
	Mz6CYmV9hMEtpJ2ESTtBxlUD0OB4tyKJqNrKfT9lC9PUp5spzt6zNpU9hyd4S6qQF9j63eSPDAjua
	33WzE+HTpil37aiWNaLfrV8dOyWLpEOB9kYNPTbNcMni5/+8rP2MAEvdWMVhmmJ+6n+rEY+mDBV+3
	8nnWLIft+KIANzzu+oxudsFQQHl0WycEREWZ8WRA558ma/5yVpqRgdOZXVxoXYjfzKE/FQ5xvrH56
	TY8WznsTMqbYYKY2BFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkF8f-00000008deB-0rg3;
	Wed, 13 Mar 2024 03:18:45 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkF8a-00000008daA-3Yg3
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 Mar 2024 03:18:43 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e5760eeb7aso4506109b3a.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 12 Mar 2024 20:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710299912; x=1710904712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErBpDoChwJS3Dz9w/fXRIf25+ofQNHhqhOBTpwuSEJ8=;
        b=JTIbnVTS8z/Oypn3pAz8vnhJ+AAzMYVBOqu6OyUqkSpJfxxXjCt7FtkPxgfE4g0m6Q
         Us3dSDEsRoO9vJ9PIjt1PJOyE+M3gfPnms5kjLOLRpFKXam76KDElg3+CFnt2ZFj1n/w
         VRDSEex3QRZPKn/tE81n+nNE7/B/TwopgnKT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710299912; x=1710904712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErBpDoChwJS3Dz9w/fXRIf25+ofQNHhqhOBTpwuSEJ8=;
        b=DhnjuqeAHlZPLG+mkglxz+R01w1ntgrcBh8vM9Iw9qga0Fmy922o9vIyk7v83y98Uj
         plZ8ELOO2/XZUstAV0s6n6QOMQkXOh4W8I9xR8zD3OiOvsGzj0KqP9r3MLyTP7fLoQSS
         GGgJshNB+Lz75x7ehFdyriTUjGNXz1h970bTrR7+JZJ/QAfecU6j93K1kYLqTXaCU1j9
         kSh+v33c2hUO9KtPOdHsC2E9Eo6d+MomgstPZ1OtMdKUWCzsXOj9blffHuWFeqUB8pEP
         V/ukPcZDqMfKksBk7oDmAqpvcZqJ8jpW+mLH+bENLdsC6sGExjd5qOI0ds8T+DMmqIwL
         gYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUX0mo49pWe4jX4OErZyKR07XoSsk83S9Ay+EHdxEP681ci9F3UsbXB+d8Y0c08XQLh457AL9Wf4CIALBCXYi6XSb1tUz0vOE+Y2zkWl+rduDyC
X-Gm-Message-State: AOJu0YzJ6yXMKGp8BacmGia4kgPsgbXyqHji9EnxvVPtmTqZFyLAS3FX
	UWfWa4Sp3J7ruryD9oi+j1MJS7xNH45gCFtehOLZedhpsJJelwMCXvRw9+jvkQ==
X-Google-Smtp-Source: AGHT+IFroIThZzohrORMRyBf4q2SfGniRe6Qp1geTDUSL9THSEZPoi4A4hryzimt0s4DNs3AfM3qQw==
X-Received: by 2002:a05:6a00:181d:b0:6e5:d3b9:2d06 with SMTP id y29-20020a056a00181d00b006e5d3b92d06mr1621988pfa.21.1710299912048;
        Tue, 12 Mar 2024 20:18:32 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c1-20020aa78c01000000b006e697bd5285sm3892427pfd.203.2024.03.12.20.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:18:31 -0700 (PDT)
Date: Tue, 12 Mar 2024 20:18:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, bp@alien8.de,
	broonie@kernel.org, dave.hansen@linux.intel.com, debug@rivosinc.com,
	hpa@zytor.com, kirill.shutemov@linux.intel.com, luto@kernel.org,
	mingo@redhat.com, peterz@infradead.org, tglx@linutronix.de,
	x86@kernel.org, christophe.leroy@csgroup.eu,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 08/12] treewide: Use initializer for struct
 vm_unmapped_area_info
Message-ID: <202403122018.DCCE1E000@keescook>
References: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
 <20240312222843.2505560-9-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312222843.2505560-9-rick.p.edgecombe@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_201840_894433_DAA26995 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 12, 2024 at 03:28:39PM -0700, Rick Edgecombe wrote:
> So to be reduce the chance of bugs via uninitialized fields, perform a
> tree wide change using the consensus for the best general way to do this
> change. Use C99 static initializing to zero the struct and remove and
> statements that simply set members to zero.
> 
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Thanks! This looks to do exactly what it describes. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
