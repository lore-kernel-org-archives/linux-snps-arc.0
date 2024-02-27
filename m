Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC73C5478C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 18:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQpQpBafKnTqE3aR4l7pR2sqnay6Wh8nbJP5fjL9Ejw=; b=ZOnLIONc88cnFX
	xJ8HVezaLNmjE58TbJQQFOZHPR6qPJUhzUvX9xqtlmP7mrmMxKZD/tjaa4GDRiMGxtoW7+iEqoRB8
	B3dqSH5Ary90VD0jYhAaFjSZOBI/AJzLUGdfH8IBVr2sxElsMFYzaZKAJ4ZzBZC+7ooPslB3rjUWP
	T12zhqjDtopk21yq9rsH8xIF98QVVN94Dzf5uMYNGtJi+eF4cc5+hwe6F99GgKoq6rNjbR9kiT8VW
	szpWOeFAaCH/f9pKNbNXh2lZiDMcx1xu+QAytIyZw0cZKTLzsstWXO5lRYj8aD5Zi7Ew4rDePGzKn
	9PdBqlBBPuiqWzgpX78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1rf-00000006MH2-30KY;
	Tue, 27 Feb 2024 18:07:39 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1rc-00000006MBj-0qJL
	for linux-snps-arc@lists.infradead.org;
	Tue, 27 Feb 2024 18:07:37 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3651b948db6so9852915ab.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 27 Feb 2024 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709057248; x=1709662048; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgrI9FN30eAJ2XZAfY9sJBg3TkLiivRBpbDR17SPpEo=;
        b=feMHyykf4cTtY0rT0EygPG/jHlDAUJ9DFCtqcCx0h+yCQDHiRnXqDbY5bB93HGFGmi
         14czncGGxCq4sleYepI0dmDDYf/N0xCE8hniES2VK73eG8ScpwGl2khhpINqtffLkTlq
         3jQjLhK7uvsSpmYCrZRPrSSifsXN8SFLtaZpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057248; x=1709662048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgrI9FN30eAJ2XZAfY9sJBg3TkLiivRBpbDR17SPpEo=;
        b=SK6FWf5+L+BB5fvGe78lecVdtG0UvynKREwE8+MLCYBRHvksJLlx3wO0fHzdp80NzU
         wEYYwXSHX+w+VsWtfioGYuGCOUE2xq/VnNiTJwBmGUNISl1NL0wdzDxAyMuBVvhWxmGo
         fS3pxdupzslpW1cYgV2emoiyOgch7y4Prqo3e+HaUv5esavvAQJMsavwXwAxXAppriDo
         10eDMHx6i91cKPJ6/yD0WESzzRrEa8hClsmSVWTMWLje/pJuxh1dx/P99cnm3F4rvBAg
         whxoA1ZL+PXqDMWRFOMEQGlifIb1BIU7QbStl2UTwD0BND0J6ITeszF4P3z0MY57AEpk
         12JA==
X-Forwarded-Encrypted: i=1; AJvYcCXIZGQM3QnyvXs86OQgNzlwTHztS+ZLNUKUJH0PAg4RVnFcD10NOJ1AI85nEXEbcJ+k+xxiIxi0kYzjsgsot5u1d73RBL7aSrz1/p+Z3to59U18
X-Gm-Message-State: AOJu0Yw1Ruer23ONwZXmW61Q6Y7d/K8H0YkxEI04uoiGHzI+bYv8VQ28
	+r2vEtn/W7kD9yzaG94hliRXzpR15UpRFcM/ZLmFAgqHGTZMiF+7JDMP9OezrQ==
X-Google-Smtp-Source: AGHT+IFpahrVJDe+RkqjDhxBgm48d+nhk6O3nvQnCIgFv/bhnbFyY12knPOFjwYUx9hP01B6x+R36g==
X-Received: by 2002:a05:6e02:522:b0:363:bb5a:3329 with SMTP id h2-20020a056e02052200b00363bb5a3329mr11593022ils.1.1709057247927;
        Tue, 27 Feb 2024 10:07:27 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fa42-20020a056a002d2a00b006e55b674e66sm10411pfb.171.2024.02.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:07:27 -0800 (PST)
Date: Tue, 27 Feb 2024 10:07:26 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202402271004.7145FDB53F@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_100736_257720_4DFE5A03 
X-CRM114-Status: GOOD (  17.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Feb 27, 2024 at 07:02:59AM +0000, Christophe Leroy wrote:
> =

> =

> Le 26/02/2024 =E0 20:09, Rick Edgecombe a =E9crit=A0:
> > Future changes will need to add a field to struct vm_unmapped_area_info.
> > This would cause trouble for any archs that don't initialize the
> > struct. Currently every user sets each field, so if new fields are
> > added, the core code parsing the struct will see garbage in the new
> > field.
> > =

> > It could be possible to initialize the new field for each arch to 0, but
> > instead simply inialize the field with a C99 struct inializing syntax.
> =

> Why doing a full init of the struct when all fields are re-written a few =

> lines after ?

It's a nice change for robustness and makes future changes easier. It's
not actually wasteful since the compiler will throw away all redundant
stores.

> If I take the exemple of powerpc function slice_find_area_bottomup():
> =

> 	struct vm_unmapped_area_info info;
> =

> 	info.flags =3D 0;
> 	info.length =3D len;
> 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
> 	info.align_offset =3D 0;

But one cleanup that is possible from explicitly zero-initializing the
whole structure would be dropping all the individual "=3D 0" assignments.
:)

-- =

Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
