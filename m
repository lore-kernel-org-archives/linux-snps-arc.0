Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC8AC433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Mar 2022 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaePvsoPQQamBjpabOHunfOvMIwjXK9m8QJoQZ/ZIgw=; b=kXnI673shSdiYh
	1w+7fnkYf9+Rx2ErjmxhJ/hQNSlkihY0/qlFDp+P3ZrXGeYyL6NBwUPklCmtrjppLo5ATswrmhMWq
	6Omw253mJOUHnBikGtRAKcYr/CcK3i6ZIv7JJhR2Dk9GELe5f47LLFGLVikFQWe6Q9Qq2+EExHfzr
	ryFBbUEdZs7qUCkt70jKTjn2LBQcQbSautQAVY6MXUN04hY+CxfCP6ECgUDX9rH/Yqm+gj6dLO9oM
	bMXda5rwJYDhDZqz25N0BXNJ6gN6Lgk5hH1G0whMm6mY66dg9yfdrcFk6IXRgeqybNpabCFVdAvGX
	58mmLs2mEN/VPwWKFUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWxvk-00DIJp-L0; Wed, 23 Mar 2022 10:09:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWxvh-00DIHJ-UK
 for linux-snps-arc@lists.infradead.org; Wed, 23 Mar 2022 10:09:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id h7so1856658lfl.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 23 Mar 2022 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U297m7J+yIZuXQj1oyHFA5IRzinK8RSyzjKF7zge+vo=;
 b=U8SFAK3togw+ehy2OsjfAIMK/8T4G2K3MqN5uBpTy5oV0F52LNcnaNmlazs/ZnJ+sU
 AgK5L4eQpATsVkI17hIkSoMyKexilQsfqTlzqDjU/EZIpGNtJGDdI9ANvPw4pO/bODwx
 jglA+2bxy5I3gxUXAzdsZcUAsUg3wHW4g5zAG2G9Jog7Bw/ayZlNCRpXd7MVfwO/lwTP
 eI322i3jjbLLmXCsS91a8pb8rp2bvauqh4mfp3zULM9r229Tvp+1Ks103rqtwEJ8LvWl
 3nbr2gzUfhuQT1dBZXkzA0cgrSSY5bRm2G3IlTDwOBeqJhmgx6lKs7gqXm9cBgXdz9bh
 S8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U297m7J+yIZuXQj1oyHFA5IRzinK8RSyzjKF7zge+vo=;
 b=JB5MbEM52PDQ42jU6iXsdFsNdWEmbV4KH2rcEy+1empjeQdGf5C1rmKRj7Zh/WSwKx
 6uEodo0XJZ8I7dPFezUb08zI8X2DP60hO4c0dnXMNoBUEkFaKcprpllWWN0RT3uwdiMl
 nl0DEY9i4uiYovGNzexDkVsdhqpvPow01AoRKRvNPLHujL9AGeC8VflE2Cj66OtsG1O6
 RqtYQj8xgD1hxvb9nLXtTgPBgUf9rt+13aiRbRy23CJkEDkjn8edMEjWpULRYyHVBb5S
 H3Tc/IwlkgeIiGVzn6qAJgQAuV+aqJ4+PudWRT3VBkQ8/zgkLGmmt8GqLHM53UagMK3y
 cyyg==
X-Gm-Message-State: AOAM533QbCGOk/7f8fd4I/YDqwEL1WUm9MbBFCGup5jj/Po5kX0SZvDN
 f5JSdDX8Z7bCmBrsKDHOGTUOugNCInt2mA==
X-Google-Smtp-Source: ABdhPJz+E8EpGpKS2j5dj/9ymhcSgm+sNDVHxxwa7G4hyrcl1ZtADJvf1UYf72RWx0wG9kIeauHimQ==
X-Received: by 2002:a19:ac42:0:b0:448:1f15:4b18 with SMTP id
 r2-20020a19ac42000000b004481f154b18mr21202671lfc.32.1648030158887; 
 Wed, 23 Mar 2022 03:09:18 -0700 (PDT)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 u5-20020a2eb805000000b0023cfa330e59sm2707663ljo.83.2022.03.23.03.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:09:18 -0700 (PDT)
Date: Wed, 23 Mar 2022 13:09:17 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: Re: [RFC PATCH 00/13] ARC: handle the lack of ZOL supporty
Message-ID: <Yjrxzb2GaQ2FLLvO@curiosity>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
 <f043c242-ee1c-a671-dd6f-b8381691d2ce@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f043c242-ee1c-a671-dd6f-b8381691d2ce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_030926_011436_04AD23C2 
X-CRM114-Status: UNSURE (   9.47  )
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

Hi Vineet, 

> Thx for doing this. I think the series mixes a few things not related to ZOL
> removal - the changelog for removal of -Os specific code seems incorrect
> etc.
> Let me repost with slight more cleanups.

Let me know if you don't have capacity to work on v2 at the moment.
In this case you may leave it to me providing review comments for
the commits that need to be improved.

Regards,
Sergey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
