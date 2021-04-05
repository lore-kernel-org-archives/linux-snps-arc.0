Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E899C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7B561284
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF7B561284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPEiXYPFtU1ADZlhr//EdtW0EC33GaZFw7DxkPSyxBw=; b=k4q00uBRpLhKTW18atMyQQry9M
	NfFSyZo9SBD0aeHiSXaDZh3z867/J7Lu1pNMvTglcTXs2bfq8GXSSZI/Z/HD/ufvhLm3Hpr3T3LJH
	SRKkKG+KxZ6eqspXELlmaGCQI50UZpmUwNM9BBLZajxHyPeiSlwspMHkXcy1yxuxuzFwXhwAPVdjC
	B9rb/7PNbQba80tYeY46hduB1Psnb1v8j/8pBHfSLXsSKK++IMGhBMpcCc73AVm8hFaJz4+NXJ1Y2
	+B1x8HOZYJC3ROuN2iBpDqonyWaqUwVLHq0S9WAOG+7I5bm/U3DK8Nf38iOB3PHqioImZW8wKSiT1
	zPfeAckg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQGu-00HPUD-Ak; Mon, 05 Apr 2021 14:32:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQGr-00HPTa-Td
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so7658419wmy.5
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56qCabGiTmp8/OA1qjGwzgIpTxwT0naSQo5r4vu8MsE=;
 b=QHs9McSf1F5G2xF3fEsoomdoTk08jMXfETJNApewAHbYLvGmt1VLoaBPkIV4O3pVm9
 1mSBYVDFvtDVun7vynRKpYdzFhuHXThKxEFxvROQ8vKp1yD2X0lQqt/qJJ4INsP4iLrM
 6U8/KXeAK1oHc8IkKgNa6q6p7uY0khm6i285ZlezHzRMCStzsiyqDqCz4VogSMZxlGOa
 x0XrmDIHW1b362HTss9E3wMz2P6pviSV6/CETjL1Rv5pN4IXOw5JccajPL8h9CuEXt2U
 GlvGdH4xfbOcV+kTVNUsjVo7BcDm9b9Qbwc/XymmY6Rq81Uscs9Yioz1Yb7UXpIJ/VLX
 g10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56qCabGiTmp8/OA1qjGwzgIpTxwT0naSQo5r4vu8MsE=;
 b=ED+2r8LSYUqqVDyDAIQ1aLV8dwDXC/lScLQleTjmWoHi2r0xvdTs3wq9VUvI73Eh2d
 niLAsoBR37kpFJzM/RXntMEcXvbsyxWSaYKu/Y1yHUSPw4dIf3tgrrgJO7ZhEhHyx/uq
 4QgnqBcp6d9XzazZrv7gLbse5c0XMzUYRjbIB7+5xoaN6CB5N4RDVSenvVBgo9H7H9+4
 J+N8PCVUkYslN2LMHnwMa/Ls0Gh6jtS+naJsbhmcf2B3ws8mS+S7jdAwtitOPBHwrGGt
 gvaKeQjl6EkOeU7lTasrNfmwiqzDcMqkRwTn/cP6zBG67cmUOFspXeNAandwFaMUbQxt
 LpIg==
X-Gm-Message-State: AOAM533kvOkscCGzkgMUP2Pz096+XnTcJuGkkwTHJn7TgwCDg0Nxgf1L
 d8bV4qb9uDvNjWXsJTDyZGfeY9oY8494Kg==
X-Google-Smtp-Source: ABdhPJzL1FnnYlnVABNcEDZI+X1NwkYu629PRg/jNBTXxd5cduN+KNvYL2sBVxz9kIsedEZmP7Va0g==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr6671649wmq.41.1617633124416; 
 Mon, 05 Apr 2021 07:32:04 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:03 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: *** ARC port for review ***
Date: Mon,  5 Apr 2021 15:31:11 +0100
Message-Id: <20210405143138.17016-1-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153206_086919_1DF3B227 
X-CRM114-Status: UNSURE (   7.89  )
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

Hello everyone,

Here is a long due refresh of ARC port patches.

The reason for taking so long was that I did a big refreshement to the
code due to the adition of the soon to release ARCv3 (64 bit) architecture.
In order to avoid further big changes in the original patches we decided to
delay the submittion and include all the changes done to support ARCv3.

Special thanks and apologies for Richard Henderson that has (long time ago)
given his feedback which unfortunately took us a while to address and improve.

Requests addressed:
 - Long list of fixes/improvements by Richard.
 - Generalization of the code to support both 32 and 64 bit targets.

Pending to be addressed:
 - Refactor of the decoder code which currently depends on string
   matching of the mnemonic.

In order to simplify the review process, we have separated the patches 
for ARCv3 from the previous emailed ARCv2 ones. Being the patches from
1 to 16 for ARCv2 and 17 to 27 for ARCv3.

Best regards,
Cupertino Miranda



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
