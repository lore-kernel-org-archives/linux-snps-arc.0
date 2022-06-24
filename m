Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8476BC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 22:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIx+xqLcq7zXKFt1LIPdX/04ZtHcFMdvuB+oOSbHQTw=; b=q+LAfOhiV/e+/P
	IT0S1BMN+2Pybi6tsREsVBdqyWxi4zqy+9rYx3X9fwzF+DiJoFvVRF7oZ7FLfC/xW4IWXrQlfOk0C
	HRDrY8QAuU6mjUhhb3nPN43XUbhGZguwY6jaNuTIPP8+fZLEKqjDTvrEHiXty6e/vA6L+kxuRsZKn
	F+LpPktqBnaQB8f8DNRrp/JAtgx4j9EvF5hN0V1oae1LNlYHz3g6Y7wguJverLswLT7L3QqF9NL+h
	HUyMPyT+FZ/n0Szp2JtsJMOTElCIGcEij2P7tVAXSsWC4kypJNSmTuc1Yo3Bp5JFdsSS6INbIKF4/
	Qg90PLPFcT6kwlTXY11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4rX2-003y0H-NO; Fri, 24 Jun 2022 22:12:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4rWs-003xyJ-4T; Fri, 24 Jun 2022 22:11:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A4F20CE2F03;
	Fri, 24 Jun 2022 22:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99D5C34114;
	Fri, 24 Jun 2022 22:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656108705;
	bh=zC/TQWUhx14RtF6bjzwQYVG5JLJVewaK3p4NYDij21Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BaTjWfs9C735LFyrl6I271K+mk1XSXmVOE143ZHBWY8j6FmF/wAVXr8+zA+cAdbxJ
	 QNctVsMV6/cWh3ASXWoaaQKStPbnXXOuNhqrkuoX1d7RvXRX4L62nQNeKo1lP4NTwN
	 xz7NSySEbcp5L7bh6Yca0Nwcm8gfzoB72UVHVKyepN4m+9yljdFYvVTNDT4tmiDVfy
	 BOOs1fviabeKc64dupMTlq1625dpVgO/jta+R+OOnIupO2vr6DIvq/iNr8vNSvImTL
	 iU4iv3DB4j9J5teg9ICQ+TUyogCkFBIxcNJR6RQM59IkP/Lm9kVCZFPeYBt/qWFtdZ
	 WxY8bFVJhLQWw==
Message-ID: <53402d57-ee3f-59b9-a8dc-59fa659f3662@kernel.org>
Date: Fri, 24 Jun 2022 15:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v9 1/5] arc: dts: Harmonize EHCI/OHCI DT nodes name
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-2-Sergey.Semin@baikalelectronics.ru>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220624141622.7149-2-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_151154_406904_38CD994B 
X-CRM114-Status: UNSURE (   9.84  )
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


On 6/24/22 07:16, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?"  . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
>
> Signed-off-by: Serge Semin<Sergey.Semin@baikalelectronics.ru>
> Acked-by: Alexey Brodkin<abrodkin@synopsys.com>
> Acked-by: Krzysztof Kozlowski<krzk@kernel.org>

This slipped thru cracks. Now on for-curr.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
