Return-Path: <SRS0=WeIn=HE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PI_HELLO,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E12C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Feb 2021 21:08:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D2264E3E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Feb 2021 21:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D2264E3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHj7XNQy1VEOqDl+uKi8X6tWg0JC3fZHDy7OpxglIyk=; b=XWaI8ez1L3vMxv0C1Z3MSSrY0R
	MqzDsXJIQkK1GY3LJRxzsotFOQEi9mxHSlIParpfkujZAskzvJ88HApVSNG2VrVZGSg71vvBItGPn
	GeuFXQWmDFElm9xQbUOb+UBoG7zpNQ43KFig5Ndd4g42LLCYPjTyy2gp4/0RUJ9DJ886ef7WF+LpG
	PzuSQTvwch1iorkD6HMdNF9Vhd5HRV0zPCwM2sTFwg4LM8bLq/WKpvaF0OwI5aCIOcOMCraq1fsD2
	LtK0vyo8VDDCnZhjuJEziZgc6SpQYMJ1SlI5WYvFppGTNAO3/PugwLkv92JYkjw9AeXjqr1CE3jol
	r9mqTBqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l72uP-0002CL-4i; Tue, 02 Feb 2021 21:08:25 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l72uM-0002By-SC
 for linux-snps-arc@lists.infradead.org; Tue, 02 Feb 2021 21:08:23 +0000
Received: by mail-lj1-x233.google.com with SMTP id a17so533284ljq.2
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Feb 2021 13:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=+s1gaEDQrspZ/qBxzsWLPfDCu3uPTxnZXSO6DojnUqY=;
 b=eObAzLnsXG/blyBi34KYz87eI4rZmMNew/5f28If6Q5320GQ+HMdR/jepOZmjFK4gq
 valwlff1zK58E+K7YYQbPpjvYgM738CeR2esu5MxtbOi1JUBLOlKMUHcfbEEwBPY2xaM
 l9/BhugBoE53lHlZnKZVqUZWPDFsIOLKgmMEQa+KGSs2fIBgbNHhOKDNBOUgQ8izmp7u
 mZksnCchcdzhXxrb55Pz/Iw6CKAoHgwi90AwoKDzhrmxwbmfrOEYyjWI4f8H/q8Tzk75
 MTsf8SKfyd29GJjGloL85TIJNU+CCJTouOQ9B0MqPsb2BcRPJHf8iCVmlPoop+oQG85o
 Oeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=+s1gaEDQrspZ/qBxzsWLPfDCu3uPTxnZXSO6DojnUqY=;
 b=OMlaWr23bMjD+vN6RAZ6mwvf2+mw/P0E3CAq9QJRY0Fevf/5oBLpTgoalZsMGj7Ayj
 v15wlMAJ6SQXs90i+YXXhTGr1Z1bJZef74McHpHfqTJsjRldf7e43Buny3bRseRAbD4m
 oWr8piIZFMHPVpok17W2eDH4rJFXysQb5dZXz1x1gSp5zr2CIMQGq+TC6kwqWltZ/SUP
 wA/nB7ip94IhtBmpzNKAeq807q4uSvYdT6drHV1E2eDDIQYk0Vts/eFA3AXNItOGtw07
 kAZyH5GkuopeHsCMhp5Q5wEzP8zUqlvHEZD9FL9kKT74J/6Fu0LSFlRCCtVuth/OgSYc
 MkNA==
X-Gm-Message-State: AOAM530lA/y2om+wtJ/XuvL8wSTJlCbIAr0R/GJ6sihyiLbbndyvuAL8
 YtNvSc1GPFUPL0rLBuu/5M2z6INf5nfVrw==
X-Google-Smtp-Source: ABdhPJxxAmDrffji32IAMKFfZV2YseYXeMYlMA3qAku1j8Hmubj2Vi1u3HPHY6YJe55+zyky5Wn0bg==
X-Received: by 2002:a2e:155e:: with SMTP id 30mr14565943ljv.489.1612300097036; 
 Tue, 02 Feb 2021 13:08:17 -0800 (PST)
Received: from gmail.com ([2a03:1b20:5:f011:31::6d])
 by smtp.gmail.com with ESMTPSA id r1sm6722lfp.306.2021.02.02.13.08.15
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 13:08:16 -0800 (PST)
Date: Tue, 2 Feb 2021 22:08:46 +0100
From: Curious Jack <shahab.vahedi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Subject: Hello Vineet
Message-ID: <YBm/XkXs1wlsr5GT@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_160822_952657_585B20BD 
X-CRM114-Status: UNSURE (   5.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Long time no see.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
