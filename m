Return-Path: <SRS0=Frhj=K4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6AAC4708F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 20:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4292F613B8
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 20:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4292F613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUxU27r7NJ7OarQ5G+NOr7u5ruXinn+xUBwTMEqOKTc=; b=mQSUBJuMidKce4
	CdLmzzhQqwzRiml6NkpWznTlg8tAD8AEFhz6RzAURpEVWw9cSLTfrw0uoGiHfJ0mOb2J3ZOVJE0Jv
	9ih2hdMq3IJOENuQWuqiSYPLZpclHcE2pzeu+7k8JEVNpmhZeQy668+fobHu+APJN0REKEGUNZD/z
	u0iWJL52Zagho+9qSenTd5rnOVHstfey2u7plZ8QOdEy0e/Y2JFR9RuLEq00b9WQOYh6SmSigf6z9
	pOfpD6gak7bQGu3hGglN8fGEewKQHYgaTwRq//mhVsyTQhmRiQnjmpd1fYvpiM4HmeW4X9EuFXQzb
	pmmYsKw4oyxOHxsyygkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loX7L-00639V-RA; Wed, 02 Jun 2021 20:05:31 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loX7K-00638t-0S
 for linux-snps-arc@lists.infradead.org; Wed, 02 Jun 2021 20:05:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6398B40153;
 Wed,  2 Jun 2021 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622664327; bh=OIIiPIku9kS8sXoiiZbylIMVvrjuN+ngQCH6cFS+jw0=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=C6jOdrwDZOQm4hCZxWHhamwufIMtf2ZuPHtxt30BnN0+hN8rGWcuXmkJSyrecq9Oj
 /xGqrOM3LLDr+83lfBp9T3EeIiSfFaLXaXDAnCOEEHZV3J6O3iAw0V/fT0y2oqXZki
 ggik4JxFoKc+YpSeHxlvqSYQ/E3xMhQtVXMRMz9C3jyShd6MHUYQlmpFoyUxzq6nmG
 dSagGpdzVw0FP/lOrsON46bPTAImP/ZUYs5REzSMtdMJWJa8+vYo0uSArUZRYpkuM4
 zLl/tc5B0DfImcrR+BPlH9wZ63uJSOCni8bXz/YOK6xxPrA4VTfxcch0ac5p5EsL2r
 N3eRqNLFruYMw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7B778A0088;
 Wed,  2 Jun 2021 20:05:23 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3E38440031;
 Wed,  2 Jun 2021 20:05:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="IUy1eYMg";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRTcUi8Ye5hRyeLL7EJ98cveceMb1yqqBTBPIk4RgOzbQ71KRY6kRgP9EDpImflfygkaq6Zm2NdnZpJciQb6QYhVQcskWOtz4w9HUsTcpQ9YvlItM2VhWG7mpaA6zyuLrXQ0XNPrmNiC7E+nA860wcY3c0kUMfAIa5wsQ5LIhxjvkzuX8XrwYVQZ02ctrQzbiBY6phztSBPr7nXI2cf6WlcwI8b0sDd3TBVZ2dN+15SoVpnlHF/yTfp4eQ6nM8CsogUfsbvz3/JK/pGdt3q/8eD657f9WbbnvGlTyUrCBF08ccKeoCDIQPsgpIqZfUP9LLOUlZUCj0CNJNQ2o/tO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIQ8eoox4t+1hVSIqKeMG9/5x9hYESaI2SaJxRxgdQM=;
 b=lHr3gbrxEcg2yb9gUuutXtXtBbGddUQro0UTP6+d5THnIuUMcW2qVWVj4l3ghDaxN8f1XuCjNLa3PQCLSvNxoqYEmhnMarr/5Vtdt5dJlLwUEP6XwwhD1EVfLww+pnFRRMlGnQhjl1uvmO5d0rD2u2FJNOcvzKtfScN4cI1tMdPSlSjbTGrh/OrjQTnyzqSq6aOtCtTta8/sLswq1SS5+jaEQKCpwmC0Lp/ARj0pSmIdv/vn7wf2pWpwrd5RQC5oRpCt5LZrOhg2ZydJ2ywL570NOeXCYnEepNMWidMM0GOqbDFTMfBVoNy7ltFyJs5O3aGDyNuoygNL1/mpHNpmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIQ8eoox4t+1hVSIqKeMG9/5x9hYESaI2SaJxRxgdQM=;
 b=IUy1eYMgqIAp9sj3d6D3Ss6Maz5Z92nrA0DYjJrp6Wg2wos2td+LUhn414ldjiZdYB5DKyHzBszCYf4nxYAaI8Y/dCm0YCX/9AVCZGiEXDBalWG3xKVBXM6IB3328neUixWYfIoPyCszgMxi2Zo7TCL0iww8kdsIYC0XYeQK7Ek=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB4598.namprd12.prod.outlook.com (2603:10b6:a03:10d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 20:05:17 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Wed, 2 Jun 2021
 20:05:17 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Guillem Jover <guillem@debian.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "980963@bugs.debian.org" <980963@bugs.debian.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Helmut Grohne <helmut@subdivi.de>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Thread-Topic: Bug#980963: dpkg: Please add ARC architecture
Thread-Index: AQHXUN0oitf8oU73oUO/tjushpYdzqr4R2WAgAjsFgA=
Date: Wed, 2 Jun 2021 20:05:17 +0000
Message-ID: <17c67381-c7a6-1917-b53f-c8fe89600f8b@synopsys.com>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <YEDm3/c3h4lW7jjK@thunder.hadrons.org>
 <f6ff72c8-46d0-db07-a741-fc9fa37f899b@synopsys.com>
 <6ca2d929-60d3-3846-876b-3b62dba635c0@synopsys.com>
 <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <4e8dbf4f-5e91-778f-7139-19a13e49ae4a@synopsys.com>
 <YLBodXkvCmMgO+ia@thunder.hadrons.org>
In-Reply-To: <YLBodXkvCmMgO+ia@thunder.hadrons.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: debian.org; dkim=none (message not signed)
 header.d=none;debian.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67c2d77b-e987-4ab2-da87-08d92601be2e
x-ms-traffictypediagnostic: BYAPR12MB4598:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB459814E77D94128D96743C52B63D9@BYAPR12MB4598.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q8VlrpWHQLjFdO9CEeNRLxDlXLCzna6noxv2NKYUE2HASwyG/Q3lGpczTC2XTyPWbTJ8ad9Rh7L9e1bR8Bylfk/6fM8Hp+ZhNvXrdAYbWdsmnhvJw/F791DKwFX9IdU2dsNXM93JFW0n5/6/UZOLLy1wgU9iz1Sc5s2BqBop/4oagRWBApT+o/M0bTxdHzMLtysHND64s1JIyPVmruzUXlgAKkiqemrttTQVCUYepxMHGgaOLTYIERzH8R95M1cSkPBzIqU3pIzkVwZBa+wmPUP2YwUklWy1pSH8lCXWztdy6K/+Ai4LElggwnD+Exk1aHMtJGltLq+qM7q23LpIJMxkPOJaUlIhJXS3J2N+bvUMOTTRoEHdWPOAa4rP94CB1UVMI7IEIj9JvONry67ZIvDXg6HJ4baVxdj7Bw+CC1HvjLQ52rPo6l8ZaeA2qyxwmON9f+5/9p8BbrhqnqQn/6/wy5vLk0cV3PhQH3TdQiCtkrGZSXyiRysese9SANimlldmbOVUJXYrf7nYaJd8IjvcFW3/7FQ4cmurXTq0+C2kK6ZIRtPQQwvf3hnqVYJ7uTxdwfyGIuHzjEdKJz4yA3Wm3ZOPyIXYrzo7h8xhpvTbGtcV4e18LPAOWJ7oMKaCRY7C1w8sjHNpqyfSfnRvlx9VzE+PyRPNUQnhVXM6agIYZZxOsHu29JQpmqUnlm3N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39850400004)(366004)(136003)(376002)(316002)(31686004)(6512007)(36756003)(76116006)(71200400001)(31696002)(2616005)(66446008)(8676002)(478600001)(6506007)(64756008)(53546011)(26005)(86362001)(66476007)(66946007)(83380400001)(110136005)(5660300002)(6486002)(8936002)(122000001)(186003)(66556008)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?JPy2U6tGeWTyKWdvQtXTK9NlZw79MrYKqGz29zesltk13WEEOjHUnoNx?=
 =?Windows-1252?Q?kIrs/pRsoGk/QV2f6/QK3yvDyQ+0GfkfY6t2Dokpd3EUS98/TGQ1CfkW?=
 =?Windows-1252?Q?m/NptSMEqpA9RJ0jrcponV9+882DUsVlrC44XiSIAHOyaXm0pwK/0blt?=
 =?Windows-1252?Q?C4E5Y45+vHAhUgEFuhxamhzYOoF1LOEixm/UehPtnKyx5F6o23xcdhB+?=
 =?Windows-1252?Q?vzFJxlM9A8G1L9JlwGaJnYBNN+9jjVSOX16Y1XUWxAjdYsZ3uFfaw5j6?=
 =?Windows-1252?Q?1f/BvfObdK1i3ViUHRkkwa/tHgQNkx9NJf/03rDPxUYnCj7i4tgAG4YC?=
 =?Windows-1252?Q?hOOFkDCDQGfQWTNpzG2TL+jyTR/H6ZBOKuqVZg1K0HmHaDzOUKRmaKwk?=
 =?Windows-1252?Q?+BJ5kndYBoHekSHzq7OdV6pfo5ko33J7E43bkILXWAewpGBu9x/5q253?=
 =?Windows-1252?Q?oHqz5cnlqAcc0Ji4en4Wqte4DPkrqjpyGqzK2sMP6utMGQ2crOGx63Tw?=
 =?Windows-1252?Q?gmh579BNkQieuKID4RJJycOC7tP4YtU3pLWkch+EjglRPP+UXjU3wCJ1?=
 =?Windows-1252?Q?weH3fCj+aN6h6rfRsS1CVuM0QRTeW17IyYI6gcXIrksmepjehCHKv4mv?=
 =?Windows-1252?Q?JGzX/p+OlPCfCKRqs0c3uATwoK3dy4wCGQ09qSbajfonkPGy29cCSoDe?=
 =?Windows-1252?Q?xcYGa/9CcHJS4xUnjpi4kP9AG5k/bw+iaZmAIYE9m3+PbqHSR96nZZ0z?=
 =?Windows-1252?Q?u4d1v+lM622tRYuh9KRVbFDhYX5GXNIjEHO6q08wR4fvCwlxtq+6Vlkh?=
 =?Windows-1252?Q?Hnan8R4EgyBOE+C73OYEC+CBjUEefUvfI2AgO2jYtGIqYGZad+bk4ySj?=
 =?Windows-1252?Q?Sj0LgNdp3sQse7eqxQNAu1qAxMbmxjkKu8oEGEOyY/KoepU/Lk9/+m9e?=
 =?Windows-1252?Q?yHukYXD1eajQWIPlmG9RCtco2pyuOXP5cA1T3KUIrCUTMfhmFEl01hai?=
 =?Windows-1252?Q?Z4NE+DGPc17MXP+2yrnzY1zCbzi9l5sMYZAIPfCcrx6zTxcr97HyeWLk?=
 =?Windows-1252?Q?piyG5i6cZ6eRV94rSsh3e7pCrDmYsS/bY0b9Yz6jFrcPkEEcYx+pHJ21?=
 =?Windows-1252?Q?32sVSD5M8dwydFsUoX6ilEPg1+/GYV/31Lc7zOoXvKbo/wwJj1xloYZ/?=
 =?Windows-1252?Q?IxLiShwrW3tBPRm24a9a0w//PZ9uTxFUAbat3nCFwohHFtYUdwe6h2Zv?=
 =?Windows-1252?Q?eZjpb27AWbChHtqNRqmronXk9e96cmuMtmliBhV/0c+HuRQt2V/x/ajF?=
 =?Windows-1252?Q?t18vJdhTEPLN8Rcjp3m+A1PfSSvV5LaSpIBaekhmLNdLgT9ZlLARCpDl?=
 =?Windows-1252?Q?/EqankN6Ve1m8FaCwSgKEadFyd8GAOTmY6Y=3D?=
Content-ID: <526D35D171E088468C9FF73A7A42CA0D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c2d77b-e987-4ab2-da87-08d92601be2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 20:05:17.4931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMXiomIcpR2LMIB0TpuMRr8/67iZiaq0P5+41Hcx6ZhtxQm1kPfsobZ9omxzcT4p5kY6IUZigdNv5gsEY/DAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_130530_150145_7694256C 
X-CRM114-Status: GOOD (  20.53  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Guillem,

On 5/27/21 8:50 PM, Guillem Jover wrote:
> I discussed this today with Vineet on IRC in #debian-bootstrap, to try
> to clarify some things, and this is the summary I think:
>
> * ARCv2 32-bit little-endian
>
>    - The arch based on ARCv2 32-bit is going to be little-endian, and
>      ideally will be hard-float, but that's pending on a patch for gcc,
>      to flip the default from soft-float. From what I understand while
>      hard and soft-float are ABI compatible in the ISA and calling
>      convention sense, they are not ABI compatible in the object
>      linking sense, and while I guess this could also perhaps be lifted,
>      it's not currently the case. My concern is that adding the support
>      before the default has been switched might mean "ABI incompatible"
>      architectures if we cannot link objects. Vineet, mentioned that
>      they might be fine settling with soft-float in that case, even
>      with the performance penalty implied (in that case, personally I
>      think adding the -gnuhf triplet would be better, but I'd not be
>      going to be doing the work, so=85 :). The patch is supposed to be
>      sent upstream around next week or so. I'd prefer to wait what
>      ends up happening there, TBH, before committing the support to
>      dpkg. As I've mentioned I'm fine with committing it once it hits
>      upstream git though.
>    - The triplet would be =ABarc-linux-gnu=BB, the Debian architecture
>      would be =ABarc=BB.

FWIW gcc patch is now in mainline (I've requested Claudiu for backport)

2021-06-02 46d04271a498 ARC: gcc driver default to hs38_linux

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
