Return-Path: <SRS0=+CSQ=LR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B31AC4743C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Jun 2021 06:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FD6611AC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Jun 2021 06:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FD6611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33g6IRq+YSbAooFPCtD888vjx8+6KUjTaeJ2SFYsQBQ=; b=iZZLjMU73YEz00VdVhtMOH3iWO
	kR5yk5BmvZoCOzf0pQ/AY+FxiDA2mF7i8FDofPpRcOVrNZxcfQJ1gFxjyrGNPnuhR1aQQ8C0rQZee
	8ykRPEssTQ3PrCE+zOZlSZdalPRmdvla9apKevjnoo6Woa22LOKEWwghUbuHNSAZZF+9ZwoYWSTmW
	yrd0QyyuaELIohOrtxWwey+ofxLyOWOZeYTVtZbtiw3YSRtY8YGUhULvH0eIDMV/oCznxi1JWQt8w
	6abNE5kQbZWNdV6iGxwBRSz3piW59aIbYWkTkEAUgThAZcQ7cWJsfUElxcDKUODgspSJTRk2kEAKZ
	Zyq7qoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvw7x-009Wbd-Pn; Wed, 23 Jun 2021 06:12:45 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvw7v-009Wa1-BK
 for linux-snps-arc@lists.infradead.org; Wed, 23 Jun 2021 06:12:44 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so741343pjn.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Jun 2021 23:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=y4xXS6IuFyqYEqoC2hQM9Va++hGF0TUuSWjzbIiNMwY=;
 b=nxOQRZgxWtOaWHe+NkmkNIgW09bqbJJtKDcAemlZg+dGtbCBeaV/zBCN6weL2QkcgV
 w2Fyz/8pMizyiD3IWIVGzZcqqAo0zm+SDKxDwxYEVwSmFbo0Zr6By2kIpNcvYYZUjuwG
 9qB/we62vUbxyZOx8A2Xkf5APcM//T5Zr227xyA0V+wY0uuheUpRfDSSNAQ65AIwQ8Mq
 x9jEAWxG5ssXdeUFYb4BEypOKCaDBe5YRgtmBJ1qtg0bg02GxtxaPdLPr4Z/GY1CkEMR
 ISaSf1CGndJ+1Zo9C6rrBdjjgeSuoR9abPP5QXng5/AiMezVFKBoQQSnt7knq+cVcugP
 g0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=y4xXS6IuFyqYEqoC2hQM9Va++hGF0TUuSWjzbIiNMwY=;
 b=r/9NuQT1SRRN+aisGti3BSwEU6E4sHcgYBr1t7p9iB4ERqpFK7uemFQwf9/pzXRpre
 0L7mPdgCqleDs1dq6OdGpxu9zShSz+CbQUb6tm1B6x8x9QaOfAGaPkOigWIsrSlV67lW
 d8+zQ7Pi4I7rJ6HmYfu93uoc1UAk4/GMDNbnRmIQP5kDPTEYgXBXpjf4Zffkv4g3yPdW
 AdF+dbMIIrprlAF1WObzdzqmPeqnneVN3Ndl2A66s0xMbZ0KBxzdJmIIz8Nj8pv1uX54
 Tx6YkQJPSLJnQA/xFvX8DReNH2OTHW1RZTTO2CuGLuYn54zUiYwXsFXkw786QT52rsz5
 +Fqg==
X-Gm-Message-State: AOAM532ZetqR5cu/XOPBsvxi+ilT1voDJ3jIt8bFPOPZof5uXOgygS9i
 kJThES/BoGvdJhuHWVzVFz8=
X-Google-Smtp-Source: ABdhPJwwAs6nyXmBVdQ+T9PamsEt/X1cDCvmD9Xqwihu4nGmxBwkFgOE5dSl/iEKdsmQqxAXpBGjfA==
X-Received: by 2002:a17:90b:107:: with SMTP id p7mr7829617pjz.1.1624428761507; 
 Tue, 22 Jun 2021 23:12:41 -0700 (PDT)
Received: from [192.168.0.118] ([103.242.196.10])
 by smtp.gmail.com with ESMTPSA id c6sm1178779pfb.39.2021.06.22.23.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 23:12:40 -0700 (PDT)
From: Saubhik Mukherjee <saubhik.mukherjee@gmail.com>
Subject: [question] De-registration does not remove port
To: vgupta@synopsys.com, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
 Pavel Andrianov <andrianov@ispras.ru>
Message-ID: <3e131267-e1b3-1b83-f8be-0577da479223@gmail.com>
Date: Wed, 23 Jun 2021 11:42:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_231243_438942_D0182A02 
X-CRM114-Status: UNSURE (   6.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

In drivers/tty/serial/arc_uart.c, arc_serial_remove always returns 0, 
instead of calling uart_remove_one_port to remove uart port from serial 
core. The comment says "This will be never be called". In my 
understanding, a port added using uart_add_one_port should be removed 
during de-registration.

Is there a reason for this behavior?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
