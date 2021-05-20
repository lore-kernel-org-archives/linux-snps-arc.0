Return-Path: <SRS0=DFiJ=KP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3136DC433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 May 2021 08:41:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EA8610A8
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 May 2021 08:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EA8610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NFTySgBSSKAfF9N0eacKwt1K+3UZDa9+qExSMHELxy4=; b=nKnSG/lb1dLiYIm+LjuRMFfye
	hs07K1NTTOrBj7G2MqpFfHAYghwazOx8j4he/42/5VlrFk4Z7XuIZ3YfFrdm37VneDkf6RMvlYsiI
	BX6P+dktf36tnISvx4XB2X2dY6ouq5yXbQ8ydGFXMcV8ivqAgIfwbwFiZe5IRsPbKxOs9IC4RlzRh
	rkF0sIdrT2Y8iTGk99gII+JSXvrmcab9jN/PlEMiyLU50gcdbegWFHbJIAvWbkoMzQFpQeKYiuxgz
	crzEH7D7UTIUWf73L80GRZOIP/y9jMvpMMHC1gg32YDuhjlV1Fd+VRy1ZdxM7M4aQMJEmIZw03OFr
	7jZjDvfKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljeFL-006Fff-B1; Thu, 20 May 2021 08:41:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljeFI-006FfE-Bh
 for linux-snps-arc@desiato.infradead.org; Thu, 20 May 2021 08:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XMQiZZSg22jIhE8ZvJthOIy0LHWTaEUVd9zL4fLvprI=; b=Gh9sgZ6NxWtt5wTjP0e8r9Zh9f
 rT4JxW3zu/MkgyGM/hPd03cBw36j3MxVyisYgAk6VDJn+Mp0y+JjUIFBvaknkIR30tdMzhea2To7e
 3MHgN10D7YFiZkyUDf/feKx+B6q8yuVZFJFK0x0LlS6f0GgLHBmcIO0AT/B3Pnj3SCc/mw20cZ6pj
 9FkNX+X7yWnl8Zsn2KZyWHh0BBMqBVMg/BGcc+QWZlGtCMb0/+jenhfj0LR3QlelPW7OBJp5ndMoM
 ZXu7LOc9CPOhHRszrP/0t1UVzkSpn5ngsDppSXbJVZw6eJ7sJ2kfca1RyTGM5uU2rOsrR5saLSTsk
 JZtc6cVw==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljeFF-00G4dW-LD
 for linux-snps-arc@lists.infradead.org; Thu, 20 May 2021 08:41:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id p24so22729987ejb.1
 for <linux-snps-arc@lists.infradead.org>; Thu, 20 May 2021 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=XMQiZZSg22jIhE8ZvJthOIy0LHWTaEUVd9zL4fLvprI=;
 b=egB1UgM+cnV0k1+AgQKwJUmJU19aQTxhisIIW1fyWB2vYs4snisDFf6JKjRU9O/QvM
 5EHUjYHwxRz1zCTV259TbtZfyba6Oq359YdpRUBffaUWb5QFyudckmNm0llUaKgbyKO6
 fzIJ4YBfPv0H1FTBrRNg1h4j2YfpM1FPuoFUFL293yN28lwGpk7ZgLz2FNspIQVxPG5T
 4qkbEWqtEclkOK3gikwL9hj6RUtEqS8Gg5L3eVwytzkUrX6pHeuJ1c6VqgUssoMpFLRj
 pRpalNZ1xIOMLiVgXabUSefJcoy0ijGC+BtzQR8EndFuGu70L1OuJZHw9VoW3kxKCNOZ
 qITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=XMQiZZSg22jIhE8ZvJthOIy0LHWTaEUVd9zL4fLvprI=;
 b=ifOj0rdKiX0WEm/XkMNm+jhUcPuXplqwuOcFBfUeFAairFSDXr1QWRh58L2mo2V6v6
 LQz9L1GhInvzANIpx4FY1yWSJ07DgFFviCK9fRBk20xW/KgxLUrXc0VrPgRkAJKwkgbS
 X5nX6yCUb0g1kwF76ioX3ikgyhBda1Ik9IIqhBUBQVOkjDoIFvjmSLNmQzGLqrZx2zNl
 vxgk7GM94NEfSX287KFRcuW02pYzRRWJ2W6YJ8Pj444I5Yuh48XxNW6Kef4lWlgr8lxY
 OTdC4RI8J8CLKDK0YE9SN9/1OHDaGKCxKeqYvYtaKDxeVOH54UTTAaWYltvzStHGCf0S
 DKGQ==
X-Gm-Message-State: AOAM533Ys3nQjmFw5j6YLUfHLN/xt6CWCrYqvrzyh7v/+pnsO5Em4VBh
 yTeab2ltnz1ilyg1uMH9F0k=
X-Google-Smtp-Source: ABdhPJz7o1wANRL6bqEccUb5K1SVG4fqS5imdn3KvtPv3wBA32wP5TgmjOc8oIsUpisZqRUm8lWNtQ==
X-Received: by 2002:a17:906:8586:: with SMTP id
 v6mr3519487ejx.304.1621500084729; 
 Thu, 20 May 2021 01:41:24 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c7sm1123157ede.37.2021.05.20.01.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:41:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ljeF8-00038p-Ml; Thu, 20 May 2021 10:41:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Vineet Gupta via buildroot <buildroot@busybox.net>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [PATCH v3 2/4] lmbench: memsize: increase delay for slow FPGAs
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com>
Date: Thu, 20 May 2021 10:41:22 +0200
In-Reply-To: <20210510180049.61421-4-vgupta@synopsys.com> (Vineet Gupta via
 buildroot's message of "Mon, 10 May 2021 11:00:47 -0700")
Message-ID: <8735uhbxvx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_014129_715861_21D8F174 
X-CRM114-Status: UNSURE (   8.02  )
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

>>>>> "Vineet" == Vineet Gupta via buildroot <buildroot@busybox.net> writes:

 > otherwise memsize bails out and erroneously reports 1 MB
 > NOK
 > ----
 > | />/lmbench/bin/arc/memsize 16
 > |
 > | 1

 > OK
 > ---
 > | />/lmbench/bin/arc/memsize 16
 > | 2MB OK3MB OK4MB OK5MB OK6MB OK7MB OK8MB OK9MB OK10MB OK11MB OK12MB OK13MB OK14MB OK15MB OK16MB OK
 > | 16

 > Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
