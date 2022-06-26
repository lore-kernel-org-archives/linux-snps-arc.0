Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2261EC43334
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Jun 2022 10:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRy5Aj7vUM8pLVKd8sPeZMXESMI8dmn63tOEdynUOfg=; b=Ef9TtO/WU/hk4z
	iXRvesm7CMp++SrYMoPAb0q1AXKS2wK2fe4wXGqM1xwJ4Vg6fMfmDz+sVYpQOc8AyrMqeJhUBajdI
	iLjhyChcWtxny+bBlMOoEeNrpgw4lANudsTB8bKecncFNsCB4mCzhR861pGflMj3BALGFGMng+zES
	aUtUHQdUnqjiOPxLHF5VZK40/yJkc0H2poQA4AGxJtF/cf0z33rBEHdvjyjWOXbdB04AMwFRVYXPs
	wiHyX/9/G/bFlo2kncvu4QY4RQhpQl8Dag+qoLYy8WPLLwqSjLIC1l6PAUSSxhSOigyyzfGl578/c
	3w1fsDpfBQkwElz8bLkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Pqd-00BIXn-0j; Sun, 26 Jun 2022 10:50:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5PqR-00BIRb-7o
	for linux-snps-arc@lists.infradead.org; Sun, 26 Jun 2022 10:50:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id q6so13294485eji.13
        for <linux-snps-arc@lists.infradead.org>; Sun, 26 Jun 2022 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qm3saVsXQFyYF7XKRzCFxHnQjtvbQdpVuuv8fnV6oQQ=;
        b=fe1iXci9tCe6L2xFZ3P7p/kc36HTF7DyalYl7LT5YmzKnyaEtnBgqkPALfoSYHafMe
         5seSCpPDdR8BxgPRyhdnMFqxf3xe7G4yT13IqyEaN+mlk28EoUneItnD88p6ExFLvkMV
         MLTO5q9Nu7Brxsbf/CaW+QS4TqRzAUsl5UG/Ogcjdy8CNSV3tsDX0u/EoStiY42fXP59
         xWLSI3Nb67HE3r/kxb+JsRZdbZKmuNsfcQD74UeD3JknRSNoqpiT3xZlxr3mghMP0ORF
         bdc7eXZCZn4C1vKzMxHkOzBUojeGzfPOKNKXbnFD9KRfG3VJ+nEcBbK9Ccl2Bv+ZLMVZ
         EIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qm3saVsXQFyYF7XKRzCFxHnQjtvbQdpVuuv8fnV6oQQ=;
        b=6UYJidvBs+AQ9Bhm/iJxLKaP7/dxqKC2wc4bo6+YGxpTB3flxZH4jIkshKfoWyVDO9
         NMVq6kkgpa8NYGAUmwuUy0/EPnbtG10ePm1fesqEv5r9W3yutea6KRAY4/zEiE3XNCiG
         TkHdVr9fNOMAIRo1PTsycIpgGezKN+HtFVyd+K9XxMqH3ami7oxiNnMlsT1Z9pMAhl6i
         sDExIIZVPZkIO2cEyv1Ewz2Cv9VR8fAM5nF/ygrB9wt0D2rjlU8g8f0uM2iowOWo4qjS
         pNNfuknWpT9c7zohGiTiCaSVkM4Tvk55kcGT9N4lbxWpp01SK878PDWS3me8FTA4TGqA
         fXXA==
X-Gm-Message-State: AJIora/RUFLNQICy9Epayd0JbpBhsbDQFJrGWUubEBOXbEQc+KocdD2/
	Gmh2WG9Y7f3Nn3S4Xwcy4r/qqQ==
X-Google-Smtp-Source: AGRyM1vsckuhI5W/5/+uG8dWjoP8xYOurUPiiZq7KICxgI9Tk9qBUslJdZ7qw4SBHIubDQ+UPYVtVg==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id s5-20020a17090699c500b006df82154ccdmr7281866ejn.684.1656240620912;
        Sun, 26 Jun 2022 03:50:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x6-20020aa7cd86000000b0043574d27ddasm5623845edv.16.2022.06.26.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 03:50:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: bjorn.andersson@linaro.org,
	mpe@ellerman.id.au,
	vz@mleia.com,
	robh@kernel.org,
	abrodkin@synopsys.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	krzk@kernel.org,
	balbi@kernel.org,
	Sergey.Semin@baikalelectronics.ru,
	agross@kernel.org,
	gregkh@linuxfoundation.org,
	vgupta@synopsys.com,
	khuong@os.amperecomputing.com,
	linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	paulus@samba.org,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	patrice.chotard@st.com,
	devicetree@vger.kernel.org,
	fancer.lancer@gmail.com,
	benh@kernel.crashing.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name
Date: Sun, 26 Jun 2022 12:50:18 +0200
Message-Id: <165624061445.7618.11344979529426500237.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru> <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_035023_327219_ED86BF3B 
X-CRM114-Status: UNSURE (   8.15  )
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

On Fri, 24 Jun 2022 17:16:21 +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named despite of the warning comment about possible backward
> compatibility issues.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name
      https://git.kernel.org/krzk/linux/c/fcf036a017b251d362559cf7eb0bb6e614ccf842

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
