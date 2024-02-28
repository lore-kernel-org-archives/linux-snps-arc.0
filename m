Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA7C5478C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Feb 2024 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYBIfG77DauNhipDQ1C4C8iAKWkO5XobCzUJhHZDYvg=; b=fIMMfJPMsAlhSe
	k2RjAwJP37Ny/8IlKClg++hpxUSjM+AgRK1oHlMtvQY4e6lhwtxevUR1Adg/fzKRmaceTknAOsITt
	KrpyMxYSjpRTH95a1CRKtp4sp5uTk5lY8tyCf9ILTkpip9e7CBBBYQfrjipio6mqaAg25/xlIjvie
	PR2v01d0ZpjnhGoKKQDbdILkMH16qyCd6WXST9bfZYDcgd3dQDWYTdqevnTwejIFBYeLmLiIYhfzw
	m6UbNhAgXoGzcPLByLBx7SsLXA20WYKG+srP+GUtDGeIfUHjmqyrYHOYxSMFAjbgnpu15/qHjsEgN
	pu7/kPAgrHLZDCMeQzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNch-0000000AH0s-0WjJ;
	Wed, 28 Feb 2024 17:21:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNcd-0000000AGz8-0VD9
	for linux-snps-arc@lists.infradead.org;
	Wed, 28 Feb 2024 17:21:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e4d869b019so3046440b3a.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 28 Feb 2024 09:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709140894; x=1709745694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1bHapS5+5iN8in9GHCNPDr+SpYos985v6N2aaB8ggk=;
        b=hWMGqlcCYE/ZGUp0wcXCEDa5JARu5tVXMb7IJKp6xhWUlS6HTnOa6OZmRoyWXog6no
         GJ5KhwHIpQP7JMz+BrzmGJMD70ZoG51OTtxn6GobKfe4QGePFY24O74CwLkyp8gz2Lli
         zPTDz+1JIDGQgqdJj+bRt6dm3COLywmAU/NKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709140894; x=1709745694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1bHapS5+5iN8in9GHCNPDr+SpYos985v6N2aaB8ggk=;
        b=VIIulZz8SjtiKYcbMqFuEWbVQJSsmu1h1r0Kp3IL+LoFgVWvdCP3PCugETF6Jbo8J/
         rpgITykl7/O4nsFuHsDUsYMsRxKA2zSdHVeV/9IpzsYre0ZUgL6eCg2slOMAsAsg1RfT
         U6Mt0XS7iHXi5TAYhhib6Sk6Dc6MLNK4Jm4mRUfJqw6ajzEfo7LQtqO6N47NAmDeo49n
         jwOWFGYlNe6XOeZqWoJ3dD/3vGW1asY7HOqB4nDU2Y73D9IRP/VtN85Ioeu19UV42IaV
         bG1ZObTdHJXJlRCx0TikukdgptlYaPVWTDyfxKRbPvbvnFTz0LOi9GRjVglbU+eolb+d
         MSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm1zMEKRJD8qkjZey9HG/L/w2gu/jd9eZ873PQHm6ZffNooL59ZAsmHJ3MPF2C9lA7kI+H5y2Zb6AzN3JAxxAD8/IVsR5EKRwX4ikOW2YcMT5y
X-Gm-Message-State: AOJu0YwjbszFujKcJABT9bd+euTkE6iHqNLRaDgBps5xvNXVJJj8B0if
	tOH/y8b6G8mSFsCe6vemcONYYVTJvT8Y//fbSH0xyFk97VvsBtKknSernYu90g==
X-Google-Smtp-Source: AGHT+IFxqvM5hQDYAzOob05oGJvol0U6qboX77jQeHs6sC34fTUoZvoLbeslLh+rshINZpV8envxoA==
X-Received: by 2002:aa7:8650:0:b0:6e5:84f6:2a9e with SMTP id a16-20020aa78650000000b006e584f62a9emr91910pfo.31.1709140894116;
        Wed, 28 Feb 2024 09:21:34 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id it1-20020a056a00458100b006e583a649b4sm90257pfb.210.2024.02.28.09.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:21:33 -0800 (PST)
Date: Wed, 28 Feb 2024 09:21:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202402280912.33AEE7A9CF@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_092135_239665_E747AEF0 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Feb 28, 2024 at 01:22:09PM +0000, Christophe Leroy wrote:
> [...]
> My worry with initialisation at declaration is it often hides missing 
> assignments. Let's take following simple exemple:
> 
> char *colour(int num)
> {
> 	char *name;
> 
> 	if (num == 0) {
> 		name = "black";
> 	} else if (num == 1) {
> 		name = "white";
> 	} else if (num == 2) {
> 	} else {
> 		name = "no colour";
> 	}
> 
> 	return name;
> }
> 
> Here, GCC warns about a missing initialisation of variable 'name'.

Sometimes. :( We build with -Wno-maybe-uninitialized because GCC gets
this wrong too often. Also, like with large structs like this, all
uninit warnings get suppressed if anything takes it by reference. So, if
before your "return name" statement above, you had something like:

	do_something(&name);

it won't warn with any option enabled.

> But if I declare it as
> 
> 	char *name = "no colour";
> 
> Then GCC won't warn anymore that we are missing a value for when num is 2.
> 
> During my life I have so many times spent huge amount of time 
> investigating issues and bugs due to missing assignments that were going 
> undetected due to default initialisation at declaration.

I totally understand. If the "uninitialized" warnings were actually
reliable, I would agree. I look at it this way:

- initializations can be missed either in static initializers or via
  run time initializers. (So the risk of mistake here is matched --
  though I'd argue it's easier to *find* static initializers when adding
  new struct members.)
- uninitialized warnings are inconsistent (this becomes an unknown risk)
- when a run time initializer is missed, the contents are whatever was
  on the stack (high risk)
- what a static initializer is missed, the content is 0 (low risk)

I think unambiguous state (always 0) is significantly more important for
the safety of the system as a whole. Yes, individual cases maybe bad
("what uid should this be? root?!") but from a general memory safety
perspective the value doesn't become potentially influenced by order of
operations, leftover stack memory, etc.

I'd agree, lifting everything into a static initializer does seem
cleanest of all the choices.

-Kees

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
