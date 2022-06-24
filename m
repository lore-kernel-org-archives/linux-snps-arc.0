Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30214C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQdmFJWhdNjEnrl5Wg3BOSWumRIzqY+uowgjHZnlyBw=; b=qcJ/sH0jjZsEJA
	MKZVviy34CywL3IMBSuO/Ei3U7UCaphHmBBQOqaetVY8bKAgyMHmVrlh9G9cG0UX6Z8TK9XzOljhl
	FW7sk96yAKMJT5nPlwnwNcgGkoWQAJbgLAkN4abUkZ6X5OWQgBnU8OpiL82HTXtSaR/VcQspC5VkE
	lLqgpX1FKxTzWp7tXALQCUGacIW9DO+B39QvVysTqpzbd4oMD/qUl7Ac016DqZVxVB9Kad7MAzvJ5
	o0UzH3DbbacjT5YfL/L9KhTq57KAi8gFtpLegprQJ4ILuJRupP54DlDG5dyZNIuu5eiIi17zjN42B
	mtylIZZ7BujvH0elwskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4my1-003CKL-8a; Fri, 24 Jun 2022 17:19:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mxx-003ByA-LU
	for linux-snps-arc@lists.infradead.org; Fri, 24 Jun 2022 17:19:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id z7so4350329edm.13
        for <linux-snps-arc@lists.infradead.org>; Fri, 24 Jun 2022 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KS34vGYRSEeom0zBAYcIutCueN9pUJGrVfFONWYZS6I=;
        b=MQpUNRQdH2CMCUcbwB0qvConkQ0Y41WRRGOC1mrEUw9Dc+Sjbe5enP+cumPAVrTUta
         B+L0hqHj5RQsjBSMgV4CGhybdo47EDlRYS4obEZpRzwd3HfVDa3Y7Vba+ZF0qcqQfug5
         o2NeMp7YD0JEJ5/GBVm5lYHwBjXzgpkYuIc6zqMEpWiFBtolOa4APvfnYMwba9JcrQqq
         6sx4bIK6zd/7hxghZEqNNQajIxkpCGl7oE6bbMHN1BtW/cttI4DDeII8LOy6mU2EMYIX
         X4MCTblnDY8ac2pnui+utOl8zKefVGlEhgZZl8Q3ijRsWCeXPKrqnQSz7XsKz8bb6Fq4
         XyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KS34vGYRSEeom0zBAYcIutCueN9pUJGrVfFONWYZS6I=;
        b=bGoBlkRhH1CxIV8YrIH4nsmUoRVyzkEAMS0o0nDxiRh9YkeojM0unC7y5xw9ytCK9v
         i+s+kOUnw1MpMOCWyy6st1Rxz8POrbW7/kOLjAg4OX69rcURpd1ezvTGYZ1ez1qPZxxK
         DhZiZkUsn51T0lbCcmsq2JkTwg1h9zmxfZ9+2w4biVzuCramvMWJCR+HbJjMmRka3D2z
         +tB5D11gy/KQgONvs+obYFBsJeeWPxWM+1TUAVh31a0pYhFQJApJA7EAbASCSytUpQ/J
         UlxxJq7s7CTYpHIvM1etm7cLQ+4DmCnOfsUYL+95fdz6BnW7WSD8F3gOnrVj5AifblO3
         JhxA==
X-Gm-Message-State: AJIora9QcH4FKYMXKU03K50u2Dy9EfE0gS6AILlnDh0qA0umDYgeZcAC
	iSHay7P9+F8Dh96RbWVsFiPwiA==
X-Google-Smtp-Source: AGRyM1sy0G4UxBbA4d5YsqvS5law/GMKQEGgXv43hk/UUfo4dMXlTbf3wk4hUoOrGV/kkymXUz9C8Q==
X-Received: by 2002:aa7:c6d9:0:b0:435:706a:4578 with SMTP id b25-20020aa7c6d9000000b00435706a4578mr196157eds.24.1656091173189;
        Fri, 24 Jun 2022 10:19:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i24-20020a170906251800b007262a1c8d20sm1445456ejb.19.2022.06.24.10.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:19:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: gregkh@linuxfoundation.org,
	mpe@ellerman.id.au,
	abrodkin@synopsys.com,
	agross@kernel.org,
	robh@kernel.org,
	vz@mleia.com,
	Sergey.Semin@baikalelectronics.ru,
	bjorn.andersson@linaro.org,
	linux-usb@vger.kernel.org,
	balbi@kernel.org,
	vgupta@synopsys.com,
	krzk@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	patrice.chotard@st.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	paulus@samba.org,
	linux-arm-kernel@lists.infradead.org,
	fancer.lancer@gmail.com,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	benh@kernel.crashing.org,
	khuong@os.amperecomputing.com
Subject: Re: (subset) [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
Date: Fri, 24 Jun 2022 19:19:30 +0200
Message-Id: <165609116546.68884.16917167353605359946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru> <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_101933_741810_DCB6E22E 
X-CRM114-Status: UNSURE (   7.57  )
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

On Fri, 24 Jun 2022 17:16:18 +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> 
> [...]

Applied, thanks!

[2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
      https://git.kernel.org/krzk/linux/c/986fd5fe55cb369c34a1dc65b1469aac536a6d50

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
