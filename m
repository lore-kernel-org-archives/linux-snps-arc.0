Return-Path: <SRS0=5ghb=FH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3768DC4361A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 19:51:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE9C221F2
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 19:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE9C221F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S3LzlTUHOVRDMxK//zsd31x0bQg68TO34fgvD/fA1VA=; b=FNbjnJEDNokx0kJG0JUv0g+SI
	nQJDHhoi+gKkBV1f1pOeaJBOWG6SbHvlAfaq000HesCY1wGnVujKkYR2LQrUApgMXVVYyEM98sRhB
	R7nto3+zITp89GW3+JMTy6YAAxrW+OGl1ytoKB/t6R1yrusRk2CjM8d0tajjWMxhvVpoK8NjMHR2P
	A5NvWXIEY0Bwf59Sh9q5hK49rrizk5gohI/ohLq8pgaRZQRTHWJoKDzFsy5LPOcjLLk0Ul51415iD
	eZeyl7fNSjEzNaE32BIVfkmeRaVIChqnKYAlGGCjER0rsar8UaSg/EieKeGO1fmeNQtsMC6fiKEep
	AuA8+UNVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkudL-0003Pc-ON; Thu, 03 Dec 2020 19:51:19 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkudJ-0003PA-A1
 for linux-snps-arc@lists.infradead.org; Thu, 03 Dec 2020 19:51:18 +0000
Received: by mail-yb1-xb44.google.com with SMTP id v92so3160546ybi.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 03 Dec 2020 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEIR1NLYaGo+kjt2ducK8nxnVtozbjav/8/FNjZtfGE=;
 b=SDsVgW5HAnYlCIKKITn7zh0uJXWr4FXwlKgDwZmxuEHqeGB7iWIogc8JcW8Rzy5wZX
 FNLSbMMKxufsMagTQcLcFDUclUQfM7rFizdiG46qtkEMWA+Xm/AeqdKTHAN0vB7Apjgm
 37+3W2rZbldDqow3X7O9DB2v2iVAMwsApRdWJ+nJYN4scJFhWFSHD4OeNtPfmzGnFC8w
 WIu4b0nRRfrRDqC+ZQGd5GIt/DL7wsEfbDkh8E+2nLMd9lCHMqgpgPlhDuJu6kDgJUbI
 9+bJQfkOiTeyhBP/sMqudWa1e75vEGb2bok51IXNctECMo3GYyJiLIWGpFKe6HuJeISg
 Zf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEIR1NLYaGo+kjt2ducK8nxnVtozbjav/8/FNjZtfGE=;
 b=QKp9fClbtRAYEEo6I9xjRNvgqJZc0/urMHHVd1b0qi2yxZNfCeu3ugWh7q7iVENsYW
 yiingar0dld04ldw5mTIrSJFkm4RsgqFZTwyIVn8AKg76QhIoyBIhO1eU9IkDOpfRSP1
 6QC3VWFOYVkkym1VIsG6JxxMWDT5R5ECwzx6pcd1CfXvOVj7rkeb+ew9Ulr+bMEeH8sm
 2fu/UuPVn0ly8Y7CYfHQvAbGNFrGZy7kkb5RQlvilVGdsJ/VYyoNDBP8jYEMvQJGtdyT
 l3VlUUM+I5QacHXZA4ZbeFe9W8VUF8hmtyV7oilNURo9A11fyTzrvqPnVE1xuqMS9ysm
 DEeQ==
X-Gm-Message-State: AOAM533zCSMuW57geDE5oWutoMDbklQ7JGiXECqUV2KVqFeHe0RmuncT
 8mdCw1r39JC7wXMytjI2DdA6/eVxHH0ZkBFZOCA=
X-Google-Smtp-Source: ABdhPJx0z866MUl5SIOgqM8j7amwVcgEOY7xGuLPGbshDce0/0LTsaT0aN84Ly2nhZVyRkQqnymIsllSiDFCAihxW3E=
X-Received: by 2002:a25:1e43:: with SMTP id e64mr1099768ybe.273.1607025075334; 
 Thu, 03 Dec 2020 11:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
 <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
 <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
 <836f6aed-8f2a-cecc-d796-be7286333160@linaro.org>
In-Reply-To: <836f6aed-8f2a-cecc-d796-be7286333160@linaro.org>
From: Cupertino Miranda <cupertinomiranda@gmail.com>
Date: Thu, 3 Dec 2020 19:51:04 +0000
Message-ID: <CAHW_PjKChVWTiEJPCgG4G1+XwRd_QUcYLKBz+Vbnkkc_Um7g4Q@mail.gmail.com>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_145117_440152_2F01B400 
X-CRM114-Status: GOOD (  22.86  )
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
Cc: qemu-devel@nongnu.org, Shahab Vahedi <shahab.vahedi@gmail.com>,
 Shahab Vahedi <shahab@synopsys.com>, Cupertino Miranda <cmiranda@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Seems perfectly doable, no objections.
It will probably take me longer to integrate it in the build system
then to get the scripts ready.
I will start by placing the ruby tool and documentation there, and
later on, integrate it in the build system.

Hope that you get re-motivated to review our patches. No pressure though ;-)
Very valuable comments, lots of improvements happening here.

On Thu, Dec 3, 2020 at 7:34 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/3/20 10:54 AM, Cupertino Miranda wrote:
> > Our generation tool has different levels of verbosity, expressing
> > instruction semantics from a pattern level up to what it is shown in
> > <semfunc.c> as comments, which is later converted to TCG format.
> > For QEMU purposes I would say that input format should be what is
> > shown as comments in <semfunc.c> file.
>
> That seems reasonable.
>
> > Also, as is, the generator is done in Ruby, and to be honest, would
> > not be very easy to redo in some other language. Would this be
> > considered a problem if we would include it as Ruby code ?
> > IMO execution of these scripts should not be a step of build process
> > but rather a development one, such that Ruby does not become a
> > requirement to build QEmu.
>
> It's not ideal -- I would have preferred python or C -- but I won't object.
>
> At minimum, I would expect build system changes that detects ruby support in
> the system, and a manual build rule that rebuilds the generated files.  This
> build + check-in process would want documenting in target/arc/README or
> something.  If there are any ruby packages required apart from the base
> language, this should be documented as well (I know nothing about ruby myself,
> just guessing based on what happens with python and perl).
>
> Even better would be build system changes that, if ruby is installed runs the
> generator, and only fall-back to the checked-in files if ruby is missing.
>
> In this way, anyone who wants to modify the code generator would merely have to
> install the ruby packages on their system, but they would not be required for a
> non-ARC developer to build.
>
>
> r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
