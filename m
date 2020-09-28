Return-Path: <SRS0=51Ju=DF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A08C2D0A8
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 18:32:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8138B20774
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 18:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y1WdH85h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZTqLywui";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nXT7Lhh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8138B20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r4QdUkNWKCeQ5F9+znVe2l01W8aP+k9WsC5/A6kONUg=; b=y1WdH85hg97rruwbyOUVeM9qg
	/Yxvu/gqKZkcA2Or9NqaEXlZCygxU9vCYSb9nvy1qWsfLXAM1/VhGtIogmKPm3HXqCa/Ni7ZfptKJ
	62BEtuyWX244+BT8LSchVDUzLOrRE2sbtEcemMuwShBd5zlYig3tqQRSXq/knrw0aUJghgbU6fYlf
	r9tIxmPNm20ZSy7U0WBHzDU4ALhYR3QhxVXd/+q50pHY3Hk+mq2iYhLcPVl5xEhP/7JUiRitHdfYr
	vvxRfC9ha48KEZFC0xwjqf5gxFihtEX+Z2IDI7GWxupkkE/znc+1XhjceamcTDTb/6CYlitAB+szf
	QAdzMkqsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMxwx-00088B-Mn; Mon, 28 Sep 2020 18:32:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMxwu-00086K-JG
 for linux-snps-arc@lists.infradead.org; Mon, 28 Sep 2020 18:32:33 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CCD8401EF;
 Mon, 28 Sep 2020 18:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1601317949; bh=kzxBlVYKvuvIUN72q7LqflV+0C7Qfq65k6NMrjp5QYU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ZTqLywuiMEM/VYUfuCyjicA2T4466lbyYClNjoAqTcktICRaY2Xq0porcEGjth8xV
 5TgWG4Epbo8TxI1kzIAaQ7OJambuDJiAV+vu1YcT8uoj0kqy0JQqyHA3c9fO+r83YB
 Oxne1lB1Q/nVxpFt56NhE+MM7kZmgqQtw8rJX17L+tbtDLzpo8n7H4+FbrkcZpmfAL
 69NVwQz15/Z26FOsYE0i1dWn+3o/Dry63lphxxcKdsS3+wbMdepnlCeiBimrAgJh8k
 MI4umDxHtjjowp6h2Inli1mKEa+U/u5xxJPCXYE2HK5W2RqAGdVhWZn6A2afpPW24B
 x/audsiygQ6ow==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4E56EA0063;
 Mon, 28 Sep 2020 18:32:26 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6FAC4400D6;
 Mon, 28 Sep 2020 18:32:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="nXT7Lhh0";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmWN/UwRWbzp6Ly42C9AB+iei3xyTgyA+iNWnrnsXombnfg2ZBySuscg+n/wK0aoMQUrGcM4+cL3vBqfTWPL3/wbEO8twrDyUbTrJBQ/ogpTl98XuO9mFvT1S4bfC0+m6ans0OBlBLLoVoW1urxz+haWXlN8UwLr44B3tzkl+5isFy+S7AOiH6t28pei6jrD7Qa1MrZPvrGjT0qiIcXkMUR2ZqpDWySyIx098QqKLNvNyUtqmzJUuSHPep2Kw7p4lp8//1DTHvLAFYs2igWAewWLoqa5eO8VedGmou7mj8YlLRLhJFDBV7eabSSiwWJKhpTBXAKIo9SCvs4Oc2JoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzxBlVYKvuvIUN72q7LqflV+0C7Qfq65k6NMrjp5QYU=;
 b=TwRl0Bi2/nsE4j9TZqAnZ9/oW5KhoYNZ8tN8m9bXKmHDXJaxz7mbA7q/Rv8mWl541tLWwbWJBhs5KAwL75VQnK6Wii56yPG/XfLwSPNaZSu7/YRVJGOobURxmI6eNIqcf7Ms9fVzy5kBOa8MaTbtaq8N/uGy2U3lR8R0o3jNft7952+oCYonlXicJkOwaEkbwTQWRVnP3j42aLIt2kwfv+9cDQi4ugshpirZsCsUFjQQmMEUwlvRfxGC+qEKzbkwGnQv/fsbColezJf0f3ZwTrrIlq+g2TNPq/Br15Ft50f0tSZ0VdLEnLwpFUZoGR+1fuvp6LBv6S/jCq+3FUg7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzxBlVYKvuvIUN72q7LqflV+0C7Qfq65k6NMrjp5QYU=;
 b=nXT7Lhh0ke90UiaATU291GTYJAqnEHjRQASewNLfxGnJ4emOFecaz0twiWCJCr7PfWuktla/ckmEl2SpRmqguWOAFVCed3XgWGhTy3iXW60nz5KwVxtQeE8HzBe86IhbP+JLcmZpX2K+hX0T277hmTs8KK9Sbsn+Vst5sZMWWW0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Mon, 28 Sep
 2020 18:32:22 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0bb:1c2d:ecb9:547]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0bb:1c2d:ecb9:547%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 18:32:22 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 6/6] ARC: [dts] fix the errors detected by dtbs_check
Thread-Topic: [PATCH v6 6/6] ARC: [dts] fix the errors detected by dtbs_check
Thread-Index: AQHWkkMTokVrmxXtIUSqHdkCu+PNUql+ZuGA
Date: Mon, 28 Sep 2020 18:32:22 +0000
Message-ID: <28f41f05-2d09-9155-a609-507874cf4b0b@synopsys.com>
References: <20200924071754.4509-1-thunder.leizhen@huawei.com>
 <20200924071754.4509-7-thunder.leizhen@huawei.com>
In-Reply-To: <20200924071754.4509-7-thunder.leizhen@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfab8b91-21da-47cc-fe8b-08d863dcd710
x-ms-traffictypediagnostic: BY5PR12MB3922:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB392292119EDD6DFF4A4E811DB6350@BY5PR12MB3922.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2CttlLzBys8AcBnLTg8yi4nYTvd7kIaZFPAdHoQKyEklZd9KG3PZc3I5gdByPKJVc2pOwojNrlyEOEzSu3TNgrjn/4LmBSqcdb6yOICX1i0IasqRuqqV7GRJmJtg8Wy0b7WpB4eDoSd31VpYO6KKHzgTCV6IJwFQCdzUVsPFIKjbpA4eG2v3D0/pX8wW3mtcpGxAsTHsAPvyuwn0kF2TV/5gsLI6YA74nX4qE1XOHkxj0lJZ9egGs06n2JwA967eipLuTi/Rg1R9KFqZboGRG8tyIJIHwAZAVy1Z3epwOWezK4CyG3X5Jec2uPQi9PmkpAq2J3IOc+DNDT6447+BkR+BUCqK9UNy/+7bTVR/IiILWl0VBY57TrUBswKHEFCRkWFO9oFXegGx6vd/VTdvt2RGzm4K2gxGnVxiHtP3ReJKt9/CSm9hzbKtm/xFZo7aS5Auim7L2iP36rCXoVf3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(71200400001)(2616005)(6486002)(2906002)(6512007)(110136005)(83380400001)(36756003)(186003)(54906003)(53546011)(6506007)(7416002)(26005)(316002)(5660300002)(31696002)(66446008)(66476007)(66556008)(64756008)(86362001)(31686004)(76116006)(478600001)(4326008)(8676002)(66946007)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HQwmT1QeI82cGsJeIZZSi8sPhH7N4/KJ1b36pyo8NilRuiFw4IwsWhfLlt/gEer37w0l8LoQiL6MjqfKb62erPtISxqrD86Dlwi8dJ203tsFnLX4h4SeV+7hI2GYSAMFODwhGMnYrm0n4u0CNw/pxfmW7LqhY50QLfmUYQwfLlMY2H3UUVXhxuPyV42fNDvwXqxlYYCiPcYlYHZZdTqmET584xjCd3uVgWV4zEkFkjYanZW+p8dlMWRkMXGfkoGaOt1vWUD/91aJqfUYSSOlWXz6LmrMOWdRrRy557r9Thiw5NV4S+FTCQfUxmH2vaFxuIBWJjlmY0evC0wYuc9L6DgC73FbXQgkl6/Zp89ytbbKBZbzRE2rm0HRh7YPjNP7M7S0itGxLQSe842JIVmwM/15b/tY1sC730jqPtGXICxu1nGdK1kXm4TkP1QDcrBSGW1YT+5BuXPPpZS8fe28NevDwmVdC1QfRpVdm/ccKVc6CvJ4DgYDxEFEeH7xrKFlnJE0ZTYwC4QkVNV1vhIbATlqDR9qOL+eGSxIHFAC1P1fC0tRWJNQcJAVCn3H6SOEOzmOs8RX8Oyr13ZaHL7rG6cE2qv3b0aC0cfXUGvl/j5AfxmEIXzEpayX+W8yYaMELPIb7uxl8ZNKJvAZiElfjw==
Content-ID: <036461496500CA45B0A0608A2351F052@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfab8b91-21da-47cc-fe8b-08d863dcd710
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 18:32:22.3236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LeR/UM+Usy2DICH7dQfT1naVMtH6zGDcCr8PBCpEfltiIZsRD/4qKeRT38SeHLGLmtPaDJIGEVwZ7SIAffMm1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_143232_774514_3BDC644F 
X-CRM114-Status: GOOD (  21.16  )
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
Cc: Haoyu Lv <lvhaoyu@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Libin <huawei.libin@huawei.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/24/20 12:17 AM, Zhen Lei wrote:
> xxx/arc/boot/dts/axs101.dt.yaml: dw-apb-ictl@e0012000: $nodename:0: \
> 'dw-apb-ictl@e0012000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
> From schema: xxx/interrupt-controller/snps,dw-apb-ictl.yaml
> 
> The node name of the interrupt controller must start with
> "interrupt-controller" instead of "dw-apb-ictl".
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Thx, I've queued this up to ARC for-curr.

-Vineet

> ---
>  arch/arc/boot/dts/axc001.dtsi         | 2 +-
>  arch/arc/boot/dts/axc003.dtsi         | 2 +-
>  arch/arc/boot/dts/axc003_idu.dtsi     | 2 +-
>  arch/arc/boot/dts/vdk_axc003.dtsi     | 2 +-
>  arch/arc/boot/dts/vdk_axc003_idu.dtsi | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
> index 79ec27c043c1da7..2a151607b08057c 100644
> --- a/arch/arc/boot/dts/axc001.dtsi
> +++ b/arch/arc/boot/dts/axc001.dtsi
> @@ -91,7 +91,7 @@
>  	 * avoid duplicating the MB dtsi file given that IRQ from
>  	 * this intc to cpu intc are different for axs101 and axs103
>  	 */
> -	mb_intc: dw-apb-ictl@e0012000 {
> +	mb_intc: interrupt-controller@e0012000 {
>  		#interrupt-cells = <1>;
>  		compatible = "snps,dw-apb-ictl";
>  		reg = < 0x0 0xe0012000 0x0 0x200 >;
> diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
> index ac8e1b463a70992..cd1edcf4f95efe6 100644
> --- a/arch/arc/boot/dts/axc003.dtsi
> +++ b/arch/arc/boot/dts/axc003.dtsi
> @@ -129,7 +129,7 @@
>  	 * avoid duplicating the MB dtsi file given that IRQ from
>  	 * this intc to cpu intc are different for axs101 and axs103
>  	 */
> -	mb_intc: dw-apb-ictl@e0012000 {
> +	mb_intc: interrupt-controller@e0012000 {
>  		#interrupt-cells = <1>;
>  		compatible = "snps,dw-apb-ictl";
>  		reg = < 0x0 0xe0012000 0x0 0x200 >;
> diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
> index 9da21e7fd246f9f..70779386ca7963a 100644
> --- a/arch/arc/boot/dts/axc003_idu.dtsi
> +++ b/arch/arc/boot/dts/axc003_idu.dtsi
> @@ -135,7 +135,7 @@
>  	 * avoid duplicating the MB dtsi file given that IRQ from
>  	 * this intc to cpu intc are different for axs101 and axs103
>  	 */
> -	mb_intc: dw-apb-ictl@e0012000 {
> +	mb_intc: interrupt-controller@e0012000 {
>  		#interrupt-cells = <1>;
>  		compatible = "snps,dw-apb-ictl";
>  		reg = < 0x0 0xe0012000 0x0 0x200 >;
> diff --git a/arch/arc/boot/dts/vdk_axc003.dtsi b/arch/arc/boot/dts/vdk_axc003.dtsi
> index f8be7ba8dad499c..c21d0eb07bf6737 100644
> --- a/arch/arc/boot/dts/vdk_axc003.dtsi
> +++ b/arch/arc/boot/dts/vdk_axc003.dtsi
> @@ -46,7 +46,7 @@
>  
>  	};
>  
> -	mb_intc: dw-apb-ictl@e0012000 {
> +	mb_intc: interrupt-controller@e0012000 {
>  		#interrupt-cells = <1>;
>  		compatible = "snps,dw-apb-ictl";
>  		reg = < 0xe0012000 0x200 >;
> diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
> index 0afa3e53a4e3932..4d348853ac7c5dc 100644
> --- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
> +++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
> @@ -54,7 +54,7 @@
>  
>  	};
>  
> -	mb_intc: dw-apb-ictl@e0012000 {
> +	mb_intc: interrupt-controller@e0012000 {
>  		#interrupt-cells = <1>;
>  		compatible = "snps,dw-apb-ictl";
>  		reg = < 0xe0012000 0x200 >;
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
