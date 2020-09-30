Return-Path: <SRS0=ZTxI=DH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71402C4727C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 20:28:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D930B2074B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2020 20:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYVMuPaI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GODO+yhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D930B2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGCAwzmX44HtNj9CVEhlzae/IpprQ20fqGLjoMfR2LE=; b=jYVMuPaIvuzpPXP2dWzDLtiWu9
	Pq4Phi96H8XeHbRP372x74V2EaB8pr1Al35FE/l1DzVZVm0K27Hwb6eooh8mcpcKihLtkfSVP3/1u
	e0xL0tjuJulXpOB08eA/W3z3eiTo5dQyVNlg1yjAxgnVLFr6NaiZYFnNHoPdhPw3w5F9UH4Bm/02f
	N3V5e2FgF2pOSUsOSEhI0XVqdPrtCYjl3SL1LEARhP96izs8FOYQ4/56yfW9F9JcRA61p2XF8/oSe
	/nqyRZINVHkqRj/XGJWJ2Lhxpi6+WpSKqW1rksOgJ4/R+VSveVjXLQeYNmAofApjfXQveCb8WORxf
	F00W1OBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNihp-0001rW-VX; Wed, 30 Sep 2020 20:28:06 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNiho-0001ql-9C
 for linux-snps-arc@lists.infradead.org; Wed, 30 Sep 2020 20:28:04 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id s19so2270670ybc.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 30 Sep 2020 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=15pFrAvOGi+eHKJgB6psh6iIBCbvYSuhPj+wQn6C7Ss=;
 b=GODO+yhYE8K4rV4d3TXseBnvX3k8oq3xiGGpurJycMA6/XeECvRgbHqjOpwLqTnbz2
 rph3+J6EzIfELzJDMZqrivkbdh/loKZ/XyPxR83ZZ4DTXhPHy7H5fYA+V4iu5wTKtXhr
 qR8dWpwKXnL+nhbdgilig6QTbjN2KUaE5EERvAAnDpiDCM0RDp1R0PpShBKVeZalbop3
 0pM1yaBBRCAu1Necugk44Om0Cam1u5jqMRaEbZsGFrj+0Jm8m05vLzQbbgCLHeM/8MwY
 skm+BZNMJgiKCMv57Xw8UuYvOGd6OMMp63lvV3tcioonQmwcEjOc8TnHqoHXbDSnYNer
 lVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=15pFrAvOGi+eHKJgB6psh6iIBCbvYSuhPj+wQn6C7Ss=;
 b=LNMTvEJmkCrPznh9FCzI408v9wGRyNx6QYuotHAQh1h2pX5mTG158lc6Y0QukWtI13
 DYx9Ls8JY9W8i4/ZSWuVuHu5HMQPjtynHVAgjZ+uxnhyMFywZKQP0x1A8Y1fPFRn3Pd3
 h2B+CttkExHFaEN48mg8XLoSrxDZwmjDZ4MX8AAsqiGk70UvVbm/XvbTvtMwSR07T66q
 Ab1bt77uEhuR+qcM9Tv07j8PeFaor9tWJ0wkZQYe8vSWRLNVUUfG1ySerkSo25G5yF2/
 Q0Nb0fW9DbMWy2PI0N1Mp29ImKNv7DYwR+ccXKHLkqBUSP5lqJjp+xFM/62LRXzasUe9
 YsPg==
X-Gm-Message-State: AOAM530INO1kAmNQF+9xffCxPlWmKu/RFP4n+fc52gK1i7ULhBuSlVLl
 NB8rrG3yRVDWbXRI/jbqLRgsrpjiO2nzUeb4QpwOsBYk
X-Google-Smtp-Source: ABdhPJyUw3r2eGO5SbXUkn25FPA+03PgQRvlPfItEU5gZezynVmQTfiMQcffj1Ko7xcZPrHkBvJatGdVLvrMGKr9gIk=
X-Received: by 2002:a25:380c:: with SMTP id f12mr6181737yba.32.1601497680554; 
 Wed, 30 Sep 2020 13:28:00 -0700 (PDT)
MIME-Version: 1.0
From: Cupertino Miranda <cupertinomiranda@gmail.com>
Date: Wed, 30 Sep 2020 21:27:49 +0100
Message-ID: <CAHW_PjJZJsYcEuAPXEK4zPN0SLqsYpZy-rUdmFKhd6JuXHWgdA@mail.gmail.com>
Subject: Test email
To: linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_162804_332740_37F4E1B5 
X-CRM114-Status: UNSURE (   3.53  )
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

testing

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
