Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441D3CAC58F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 14 Sep 2025 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0XwhfGErcBbQ0/Ybwb9Q1sJWvm4GU7SC71JNNM+hAk=; b=TO3GGIJRMfCRV8
	mff6IRkH07cTScU67fp2VZnD/QDwiIdS9A7wbot1pmq+j9ZwUIXWZMrnHeQE3ce5LOF/VF0s4jy6l
	YRGSJRfVj5CvHoGdSC8xXE+4gGukbZICvYqMvbKrPlhUxIDNR+W7lnsfHOueBZ9ent2zpWfsdAM8V
	1UBremupDfv3AdyWmP2POFYgYDoQv8tzEQAjhkHfgFOHvvDqfC4KsZNMH9RRvnk1zz2OwnI8xDT10
	gbl/YfmG2tyJl8fgRe4AHDUrlqDlsHBMnuP0FIkmhSntmVP076bF7PT9LWVS1QqIqPxHI6bFrjqva
	dZTLKUeWdoq9RupA4FiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeD8-0000000HUqM-03to;
	Sun, 14 Sep 2025 04:19:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxeD4-0000000HUoV-2KmS
	for linux-snps-arc@lists.infradead.org;
	Sun, 14 Sep 2025 04:19:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b042cc39551so517039866b.0
        for <linux-snps-arc@lists.infradead.org>; Sat, 13 Sep 2025 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823569; x=1758428369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=i61K4bxjQxphbKR5XDfL9ITN2JqnD8OT+w31bCn8eI6HYw/Coi1JYcuIEbL/PXghKv
         eL4gzJriILRpdbtLoAaLpzmAKolqCHgWUzURnhMbVrFQ2ClwjSS/N6RN8CyuBPUY57rv
         EN48beJxu3EnnxjGPuHKBeh9w8y9L+y5PRfMMEKmQMPM8aJMXefdcHwyCeAd3dxDalLR
         gIBfNLzcl2VumagVps/Onnx3Sw7gKMxfDBi0vS5O+Kjfsi8U7CGSdEILLm6pp3Xe+HMP
         nxqrPwS0Mut363cT1h3FKE/0f8w2n/qbnPKPGs4rOrFiroMlEdT1/2bMmAVGMZc6L4ly
         aXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823569; x=1758428369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=whLbZI82Q0EiqhJtldNRDTkdWCDESSb/w/jtjXzvL/eIbwbJkNOHn9ZkaNsIAg+xdu
         O0Zyw+CrXT3/aQA4Elx7EWVOZIcCOQKvln1bC2iyGqBEA1gkiBktYUbw0/0l6gM/AU+k
         htOSHYi67CoZhJt+cENDlpRj95u/sn8csAowfdjF8PglsD43q0FdcgtXh7k62RebeV3a
         ilsEvhcPtFdW1bbFsm7ZjZWLDLgXQmGHpefu52FcoQRcKbQa9ZWGhbHcAuKoQIb80NFw
         4SVNPnJtioGTaes33QllIo1Xsdh2iKUKNvGmeBJuoYvf6zLXp6KUuZ+m1ajY0HoNAwWm
         r85A==
X-Forwarded-Encrypted: i=1; AJvYcCVCgJ9a5x9i2o7FC7+KvTWIYWOXzA28N0byuxhRFkjhkdbS6SBJVJb0FbkI6etqAFzZBJNgxlxwax8tjjL2/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBkQEDs7Yjx428UIL/0+tN6iHHQORGfRufgLJZGCFFofW0G6B6
	oZlF+Ccz8AvJ8S7cO+HmfOfHRNFRDICKEVjlT6HMSqnrHxprTgFE0y8f
X-Gm-Gg: ASbGncsyK33I4/TOAw4oEOwE8DQqi4JUGcOotcx7r5y9owe+W/YCYAgkcFh/DxgIAXz
	IJMC5rCGDmO16qOuCbeT9YrhexG/bFTe22i5B7jkSKNJX5ec7TXsu23zTC+JQzwjB/oT30q/2JR
	BOvrXSsVSnOnXAhw3bLfk/8tbUL914Vvxt7+X+sTQhJL/08Yj7wIVhgh8w3/NfnzLFUMqMe5mRy
	LmXnvSOL2wKCIlMb4zgyqVYUrFZVCafDLqAUxPylTraO1531uwVIoyoINHSrvtXRvErKvvFq/ln
	JpWNn7bKyhczfXykEcLr3jyk3YvnWGdodE9jKzptPMzcsOEv8mXM9BcZ64CIdmjUCpNCqyFREIS
	qAriQL4mleOvB6jDj0Osyhml8AMk7QA==
X-Google-Smtp-Source: AGHT+IF6mujdx9qWAhF6oXDc9ZfcQYBKEdRbKR8jum+cm7upWvg9UYWarRjAWufJtq6SFHzRS8+jpA==
X-Received: by 2002:a17:907:9809:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b07c353a723mr763099266b.8.1757823568595;
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07c28f190fsm504796666b.39.2025.09.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
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
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Sun, 14 Sep 2025 07:19:23 +0300
Message-ID: <20250914041923.4119219-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_211930_612210_75F0FB96 
X-CRM114-Status: UNSURE (   3.93  )
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

Gmail banned me after first bunch of letters.
Just now I sent remaining letters.
So now the patchset is ready for review

-- 
Askar Safin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
