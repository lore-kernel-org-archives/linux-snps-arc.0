From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Fri, 4 Dec 2015 09:07:29 +0100
Subject: [PATCH v3 01/18] Documentation: Add EZchip vendor to binding list
In-Reply-To: <1448974985-11487-2-git-send-email-noamc@ezchip.com>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-2-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <566149C1.8070502@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 12/01/2015 02:02 PM, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
>
> Add EZchip to vendor prefixes list.
> EZchip introduce the NPS platform for the ARC architecture.
>
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Acked-by: Rob Herring <robh+dt at kernel.org>
> Cc: Pawel Moll <pawel.moll at arm.com>
> ---
>   Documentation/devicetree/bindings/arc/eznps.txt    |    7 +++++++
>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>   2 files changed, 8 insertions(+), 0 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arc/eznps.txt
>
> diff --git a/Documentation/devicetree/bindings/arc/eznps.txt b/Documentation/devicetree/bindings/arc/eznps.txt
> new file mode 100644
> index 0000000..f8b5e9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arc/eznps.txt
> @@ -0,0 +1,7 @@
> +EZchip NPS Network Proccessor Platforms Device Tree Bindings

Processor

-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
