Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EFECAC597
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 Sep 2025 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/bbsoo37jn5z8ZAHa+fFT4VAxKPnCX10fiHzbTA0mU=; b=c5NtdPObTYDWO8
	sCAg8LEQAga69F0El7SKr23FRo+1JWbEnEPdMDUtmbksKDkmEcqu5eByfwCufmIcpKEBkz0/PLUZg
	6MW9+xV8+QeQW1Hi49CnTgf7EfECvTGZZLtFWdrLI8HIZwywSZLEmAsLc/SeImPVSwXRBmLcb9G+U
	F39NImjdxL7WxRk1y3g/SO3jQJLNa5eL6hQ0jmcLRzSS08Wr9k3vKlyTuBbNpv3OTasNLVoIVp3/l
	9m7yr7Qo9CCQUe7InOIJ74dPOqgtIfiWYiUqUcrTwfmRuGO88JhoCXbnXTe2MRHdD9Vkaq9uOnF71
	hYiDwmxzSoOluEdFgFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKlq-0000000130d-1BIp;
	Thu, 18 Sep 2025 19:58:22 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKlm-000000012xk-2JKc
	for linux-snps-arc@lists.infradead.org;
	Thu, 18 Sep 2025 19:58:20 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62f0bf564e4so1630224a12.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 18 Sep 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=aVScytwG+5OLN84c5kL14WxP55gqpSNJQtbZJEAFWCrMlLf16w4Biih4D39ULPcNrr
         Z14JUpEaGpRHZnmzBurD14qXWHvojpaoE47EcQpbTG0FYNNZTh0EvwBN5sdMg3MBenWj
         URlsVTmKgGExaYcNGznbc1Wny+L/pav4VBBCbZ73czSIwqnu4dQQm8kCmWNK9xixvSiQ
         I/fNGsuNRhsOZYadZy3980WRuz8B0Yez34uygnauTZc2O6IXUIAyHoMc7pJUrHRQzzGJ
         u+8pf6y+7Fw27ZHjxWmyoQrzvm7qPep7fs12NYLfsapHPh0qUTZXFEJ37S2U1lvYQeHU
         qfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=WR5kIk8n62+jDs7IWhqHDvMwP5rJa5rJdddhEHZ85VMcf9UIERALgkMvioTfbGAzzZ
         fcvvPEalcTmDufSVAeJnjQouiRsgCI/gWrif8eR5Iz1+Ry3MHf7I6+YFU+HsKq/ajisM
         m/I1+gPTC3y+k6NpwIKjwG2fehqt+fD/TZKc8EvQsTY+I13Q9iiqD90YplreTFbC26jy
         OzKSTd06crgwpuTIKBgNNuBunTrPIyHlGYpcmb/yb32llfO5qa2NTDAuMbQjjEXtnET7
         AOV7rezNzDWaUyxNGALmHRZQGX5MxoV8EZCz6Sm8XwuNsxyWxFPY4/UPDC4Gtt+IeOlt
         nwhA==
X-Forwarded-Encrypted: i=1; AJvYcCX8YHtLUAgUcZmFk8tkLajSWPEIJWtaIXpDwod3Cb/muPtLSb63fD42OawoGr6dGor1zptWFc78zFpTLmVIFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/EBlEDeINgc53KO30bCGiFXV/bUpmA8QzzJcQtAx3AAPzcOk
	5UiNZ9nqEncZmWiUxSrpdm8YWTxOCijtfVTvQWPn/AE51BrlT6OUQEAf
X-Gm-Gg: ASbGnctCu+4aBxuKX8uPBJZokrkS2Vl8vGQpXjunvEKS2CR1TBCR8uV8fx16a/5Ib+Q
	Xi0CLBpCz3UWDKTXdgRZMw9bUt9bF8MaEXgo6WxIifVtpbwcaR4vxF8AhjDUTYX0gzfHHZDRim9
	gCycCh9xwK+UQA50SAgaJJjcEgTdQswYANpg134uk3I1hdWPVK5T/ZkLE1BSTTdc2GoaJ+bENNO
	VdvnNzSL95wZAHCOwEnuBLAPbEjV3DL+5+NxLKwWGkDq6Zn5KDhGDfkLKrM2EmmFngPHfM6Tcez
	qIHQ82uWLXe2fHOtwJKaYuqaNGb3I+v0AOxLvLom4ouwGKUeWfvCqGvbuRQNcYKeaKT/n9pWxU2
	RrU35OsOKGSHLWzTNDSATD738k6+Mll3qBQuD3w==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_125818_600094_F8BB7804 
X-CRM114-Status: UNSURE (   6.97  )
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

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
